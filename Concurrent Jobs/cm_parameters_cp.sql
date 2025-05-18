SELECT 
cp.user_concurrent_program_name CP_Name,  -- The Concurrent Program name
dfcu.end_user_column_name Column_name, -- The real argument name 
lv.meaning data_type, -- The data type of argument
ffv.maximum_size, -- The length of the argument
dfcu.required_flag, -- The argument required or not
dfcu.display_flag, -- The argument displayed or not on Oracle Form 
dfcu.default_value, -- The default value of the argument
dfcu.column_seq_num -- The argument sequence number  
FROM apps.fnd_concurrent_programs_vl cp
  LEFT OUTER JOIN apps.fnd_descr_flex_col_usage_vl dfcu 
ON dfcu.descriptive_flexfield_name
    ='$SRS$.'||cp.concurrent_program_name
  LEFT OUTER JOIN apps.fnd_flex_value_sets ffv 
ON ffv.flex_value_set_id = dfcu.flex_value_set_id
  LEFT OUTER JOIN apps.fnd_lookup_values_vl lv 
ON lv.lookup_code = ffv.format_type 
AND lv.lookup_type = 				'FIELD_TYPE'
AND lv.enabled_flag = 'Y'
AND lv.security_group_id = 0
AND lv.view_application_id = 0
WHERE  cp.USER_CONCURRENT_PROGRAM_NAME = 'YOUR_PROGRAM_NAME'
ORDER BY cp.concurrent_program_name, dfcu.column_seq_num;


SELECT cp.user_concurrent_program_name,
cp.concurrent_program_name ,
ap.application_name ,
cp.description ,
cp.enabled_flag,
cp.output_file_type ,
cx.executable_name ,
lv.meaning ,
cx.user_executable_name,
df.column_seq_num ,
df.end_user_column_name ,
df.description,
df.enabled_flag ,
df.required_flag ,
df.security_enabled_flag,
df.display_flag ,
fvs.flex_value_set_name,
df.default_type ,
df.default_value 
FROM apps.fnd_concurrent_programs_vl cp,
apps.fnd_executables_form_v cx,
apps.fnd_application_vl ap,
apps.fnd_descr_flex_col_usage_vl df,
apps.fnd_flex_value_sets fvs,
apps.fnd_lookup_values lv
WHERE cp.executable_id=cx.executable_id
AND cp.application_id=ap.application_id
AND fvs.flex_value_set_id=df.flex_value_set_id
AND lv.lookup_type = 'CP_EXECUTION_METHOD_CODE'
AND lv.lookup_code = cx.execution_method_code
AND cp.user_concurrent_program_name like 'YOUR_PROGRAM_NAME'
AND df.descriptive_flexfield_name = '$SRS$.'||cp.concurrent_program_name
AND lv.language='US'
ORDER BY df.column_seq_num;
