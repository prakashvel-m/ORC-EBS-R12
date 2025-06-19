SELECT 
    fcpt.user_concurrent_program_name,
    fcp.concurrent_program_name AS short_name,
    fat.application_name AS program_application_name,
    fet.executable_name,
    fat1.application_name AS executable_application_name,
    flv.meaning AS execution_method,
    fet.execution_file_name,
    SUBSTR(fet.execution_file_name, 1, INSTR(fet.execution_file_name, '.') - 1) AS package_name,
    SUBSTR(fet.execution_file_name, INSTR(fet.execution_file_name, '.') + 1) AS procedure_name,
    fcp.enable_trace,
    dob.status AS pkg_status,
    dob.last_ddl_time AS pkg_last_ddl_time,
    dob.object_id AS pkgobject_id
FROM 
    fnd_concurrent_programs_tl fcpt
JOIN 
    fnd_concurrent_programs fcp
    ON fcpt.concurrent_program_id = fcp.concurrent_program_id
    AND fcpt.application_id = fcp.application_id
JOIN 
    fnd_application_tl fat
    ON fcp.application_id = fat.application_id
    AND fcpt.application_id = fat.application_id
JOIN 
    fnd_executables fet
    ON fcp.executable_id = fet.executable_id
    AND fcp.executable_application_id = fet.application_id
JOIN 
    fnd_application_tl fat1
    ON fet.application_id = fat1.application_id
JOIN 
    FND_LOOKUP_VALUES flv
    ON flv.lookup_code = fet.execution_method_code
    AND flv.lookup_type = 'CP_EXECUTION_METHOD_CODE'
LEFT JOIN 
    dba_objects dob
    ON dob.object_name = SUBSTR(fet.execution_file_name, 1, INSTR(fet.execution_file_name, '.') - 1)
    AND dob.object_type = 'PACKAGE'
LEFT JOIN 
    dba_procedures dp
    ON dp.object_name = SUBSTR(fet.execution_file_name, 1, INSTR(fet.execution_file_name, '.') - 1)
    AND dp.procedure_name = SUBSTR(fet.execution_file_name, INSTR(fet.execution_file_name, '.') + 1)
WHERE 
    fcpt.user_concurrent_program_name = 'Synchronize Territory Assignment Rules';
