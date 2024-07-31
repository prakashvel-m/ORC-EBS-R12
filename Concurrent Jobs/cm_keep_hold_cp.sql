-- HOLDING AND RELEASING MULTIPLE JOBS

-- Hold pending jobs:

update apps.fnd_concurrent_requests set hold_flag = 'Y',last_update_date = sysdate, last_updated_by = -1
where request_id in
(select distinct count(*) request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = 'GEONT Agent Transition - APL'
and phase_code = 'P'
and requestor ='214017235';);

--Verify no of rows before commit

select distinct count(*) request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = 'GEONT Agent Transition - APL'
and phase_code = 'P'
and requestor ='214017235';

-- Release jobs:

update apps.fnd_concurrent_requests set hold_flag = 'N', last_update_date = sysdate, last_updated_by = -1
where hold_flag = 'Y' and request_id in
(select distinct request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = 'GEONT Agent Transition - APL'
and phase_code = 'P'
and requestor ='214017235';);


update apps.fnd_concurrent_requests set status_code='X', phase_code='C'
where request_id in
(
select distinct count(*) request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = 'GEWSH Pick confirm program - APL (GEWSH Pick confirm program - APL)'
and requestor = '515115268'
and phase_code = 'P'
and status_code = 'Q'
);

update apps.fnd_concurrent_requests 
set hold_flag='N', priority=20
where phase_code='P'
and status_code='Q' 
and concurrent_program_id='331445'
and HOLD_FLAG='Y'
and rownum<11;


select hold_flag,requestor from apps.fnd_concurrent_requests where request_id = '1339665779'
