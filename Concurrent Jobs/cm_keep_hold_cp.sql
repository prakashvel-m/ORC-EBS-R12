-- HOLDING AND RELEASING MULTIPLE JOBS

-- Hold pending jobs:

update apps.fnd_concurrent_requests set hold_flag = 'Y',last_update_date = sysdate, last_updated_by = -1
where request_id in
(select distinct count(*) request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = ''
and phase_code = 'P'
and requestor ='';);

--Verify no of rows before commit

select distinct count(*) request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = ''
and phase_code = 'P'
and requestor ='';

-- Release jobs:

update apps.fnd_concurrent_requests set hold_flag = 'N', last_update_date = sysdate, last_updated_by = -1
where hold_flag = 'Y' and request_id in
(select distinct request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = ''
and phase_code = 'P'
and requestor ='';);


update apps.fnd_concurrent_requests set status_code='X', phase_code='C'
where request_id in
(
select distinct count(*) request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = ''
and requestor = ''
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
