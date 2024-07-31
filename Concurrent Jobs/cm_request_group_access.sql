SELECT fu.user_name, frg.request_group_name, fcp.concurrent_program_name
FROM fnd_user fu, fnd_user_resp_groups_direct fur, fnd_responsibility_vl fr, fnd_request_group_units frgu, fnd_concurrent_programs_vl fcp, fnd_request_groups frg
WHERE fu.user_id = fur.user_id
AND fur.responsibility_id = fr.responsibility_id
AND fr.request_group_id = frg.request_group_id
AND frg.request_group_id = frgu.request_group_id
AND frgu.request_unit_id = fcp.concurrent_program_id
AND fu.user_name = '';
