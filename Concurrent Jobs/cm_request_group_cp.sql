-- REQUEST GROUP OF THE REQUEST

SELECT fcp.user_concurrent_program_name, frg.request_group_name,frgu.CREATION_DATE,frgu.LAST_UPDATE_DATE,fu.USER_NAME as SSO,fu.description as UPDATED_BY
FROM fnd_request_groups frg, fnd_request_group_units frgu, fnd_concurrent_programs_vl fcp,fnd_user fu
WHERE frgu.request_group_id = frg.request_group_id
AND frgu.request_unit_id = fcp.concurrent_program_id
AND frgu.LAST_UPDATED_BY = fu.user_id
AND fcp.user_concurrent_program_name = 'user_concurrent_program_name'
ORDER BY LAST_UPDATE_DATE DESC;


-- PROGRAMS UNDER THE REQUEST GROUP

SELECT fcp.user_concurrent_program_name, frg.request_group_name,frgu.CREATION_DATE,frgu.LAST_UPDATE_DATE,fu.USER_NAME as SSO,fu.description as UPDATED_BY
FROM fnd_request_groups frg, fnd_request_group_units frgu, fnd_concurrent_programs_vl fcp,fnd_user fu
WHERE frgu.request_group_id = frg.request_group_id
AND frgu.request_unit_id = fcp.concurrent_program_id
AND frgu.LAST_UPDATED_BY = fu.user_id
AND frg.request_group_name = 'request_group_name'
ORDER BY LAST_UPDATE_DATE DESC;
