SELECT
    fcr.request_id,
    fcr.description,
    to_char(fcr.actual_start_date, 'DD/MM/YY HH24:MI') time_started,
	to_char(fcr.actual_completion_date, 'DD/MM/YY HH24:MI') time_completed,
    round((nvl(fcr.actual_completion_date, sysdate) - fcr.actual_start_date) * 24 * 60,0) time_taken,
    fcr.requestor,
	fu.user_name AS updated_by,
	TO_CHAR(fcr.last_update_date,'DD-MON-YYYY HH24:MI:SS') last_update_date,
    fcr.program,
    fcr.phase_code,
    fcr.status_code, 
    fcr.completion_text
FROM
    apps.fnd_conc_req_summary_v fcr,
	fnd_user fu
WHERE
    fcr.request_id IN (1477637896) and
	fcr.last_updated_by = fu.user_id;	
