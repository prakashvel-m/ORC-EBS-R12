SELECT fcp.user_concurrent_program_name, fu.user_name as SSO,fu.description as USERNAME, fcp.last_update_date,fcp.enable_trace
FROM fnd_concurrent_programs_vl fcp
JOIN fnd_user fu ON fcp.last_updated_by = fu.user_id
WHERE fcp.user_concurrent_program_name in ('Program_Name');
