select distinct count(*) from APPS.FND_CONC_REQ_SUMMARY_V
where program = 'GEQP Get Price Details Program STANDARD ? APL (GEQP Get Price Details Program STANDARD – APL)'
and requestor = '515121729'
and phase_code = 'R'
and status_code = 'R';

update apps.fnd_concurrent_requests set status_code='X', phase_code='C'
where request_id in
(
select distinct request_id from APPS.FND_CONC_REQ_SUMMARY_V
where program = 'GEQP Get Price Details Program STANDARD ? APL (GEQP Get Price Details Program STANDARD – APL)'
and requestor = '515121729'
and phase_code = 'R'
and status_code = 'R'
);
