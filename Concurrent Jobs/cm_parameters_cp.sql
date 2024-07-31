SELECT 
cp.user_concurrent_program_name CP_Name,  -- The Concurrent Program name
dfcu.end_user_column_name Column_name, -- The real argument name 
lv.meaning data_type, -- The data type of argument
ffv.maximum_size, -- The length of the argument
dfcu.required_flag, -- The argument required or not
dfcu.display_flag, -- The argument displayed or not on Oracle Form 
dfcu.default_value, -- The default value of the argument
dfcu.column_seq_num -- The argument sequence number  
FROM fnd_concurrent_programs_vl cp
  LEFT OUTER JOIN fnd_descr_flex_col_usage_vl dfcu 
ON dfcu.descriptive_flexfield_name
    ='$SRS$.'||cp.concurrent_program_name
  LEFT OUTER JOIN fnd_flex_value_sets ffv 
ON ffv.flex_value_set_id = dfcu.flex_value_set_id
  LEFT OUTER JOIN fnd_lookup_values_vl lv 
ON lv.lookup_code = ffv.format_type 
AND lv.lookup_type = 				'FIELD_TYPE'
AND lv.enabled_flag = 'Y'
AND lv.security_group_id = 0
AND lv.view_application_id = 0
WHERE  cp.USER_CONCURRENT_PROGRAM_NAME = 'USER_CONCURRENT_PROGRAM_NAME'
ORDER BY cp.concurrent_program_name, dfcu.column_seq_num;
