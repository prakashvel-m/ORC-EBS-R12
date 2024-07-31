SELECT rs.user_request_set_name "Set Name",
rs.request_set_name "Set code",
rs.description "Description",
rss.display_sequence Seq,
cp.user_concurrent_program_name "Concurrent Program",
ap.application_name "Application",
e.executable_name "Executable",
e.execution_file_name "Executable File",
lv.meaning "Executable Type"

FROM apps.fnd_request_sets_vl rs,
apps.fnd_req_set_stages_form_v rss,
applsys.fnd_request_set_programs rsp,
apps.fnd_concurrent_programs_vl cp,
apps.fnd_executables e,
apps.fnd_lookup_values lv,
apps.fnd_application_vl ap

WHERE rs.application_id = rss.set_application_id
AND rs.request_set_id = rss.request_set_id
AND rss.set_application_id = rsp.set_application_id
AND rss.request_set_id = rsp.request_set_id
AND rss.request_set_stage_id = rsp.request_set_stage_id
AND rsp.program_application_id = cp.application_id
AND rsp.concurrent_program_id = cp.concurrent_program_id
AND cp.executable_id = e.executable_id
AND cp.executable_application_id = e.application_id
AND e.application_id=ap.application_id
AND lv.lookup_type = 'CP_EXECUTION_METHOD_CODE'
AND lv.lookup_code = e.execution_method_code
AND rs.user_request_set_name like '%job_name%'
AND lv.language='US'
