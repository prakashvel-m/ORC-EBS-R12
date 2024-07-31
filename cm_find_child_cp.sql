select /*+ ORDERED USE_NL(x fcr fcp fcptl)*/
fcr.request_id "Request ID",
fcr.requested_by "User",
substr(DECODE (FCR.DESCRIPTION, NULL,
FCPTL.USER_CONCURRENT_PROGRAM_NAME,
FCR.DESCRIPTION||' ('||FCPTL.USER_CONCURRENT_PROGRAM_NAME||')'),1,80)"Program Name",
round((fcr.actual_completion_date - fcr.actual_start_date)*1440,2) "Elapsed Time",
oracle_process_id "Trace File ID" ,
fcr.phase_code "Phase",
fcr.status_code "Status",
to_char(fcr.request_date,'DD-MON-YYYY HH24:MI:SS') "Submitted",
round((fcr.actual_start_date - fcr.request_date)*1440,1) "Delay",
to_char(fcr.actual_start_date,'DD-MON-YYYY HH24:MI:SS') "Start Time",
to_char(fcr.actual_completion_date, 'DD-MON-YYYY HH24:MI:SS') "End Time",
fcr.argument_text "Parameters"
from (select /*+ index (fcr1 FND_CONCURRENT_REQUESTS_N3) */
fcr1.request_id
from fnd_concurrent_requests fcr1
where 1=1
start with fcr1.request_id = 1419900016
connect by prior fcr1.request_id = fcr1.parent_request_id) x,
fnd_concurrent_requests fcr,
fnd_concurrent_programs fcp,
fnd_concurrent_programs_tl fcptl
where fcr.request_id = x.request_id
and fcr.concurrent_program_id = fcp.concurrent_program_id
and fcr.program_application_id = fcp.application_id
and fcp.application_id = fcptl.application_id
and fcp.concurrent_program_id = fcptl.concurrent_program_id
and fcptl.language = 'US'
order by 1;
