select c.request_id,d.program,b.USER_CONCURRENT_QUEUE_NAME
from fnd_concurrent_processes a,
fnd_concurrent_queues_vl b, fnd_concurrent_requests c,apps.fnd_conc_req_summary_v d
where  a.CONCURRENT_QUEUE_ID = b.CONCURRENT_QUEUE_ID
and    a.CONCURRENT_PROCESS_ID = c.controlling_manager
and c.request_id=d.request_id
and c.phase_code=d.phase_code
--and    c.request_id = 1315932113;
and c.phase_code ='R' and c.status_code='R'
and b.USER_CONCURRENT_QUEUE_NAME = 'STANDARD';


 ----- Group under specific manager 
   
   
select d.program,d.requestor,c.status_code as S_CODE, count(1) as NOs,C.PRIORITY
from fnd_concurrent_processes a,
fnd_concurrent_queues_vl b, fnd_concurrent_requests c,apps.fnd_conc_req_summary_v d
where  a.CONCURRENT_QUEUE_ID = b.CONCURRENT_QUEUE_ID
and    a.CONCURRENT_PROCESS_ID = c.controlling_manager
and c.request_id=d.request_id
and c.phase_code=d.phase_code
--and    c.request_id = 1315932113;
and c.phase_code ='R' and c.status_code='R'
and b.USER_CONCURRENT_QUEUE_NAME = 'STANDARD'
group by d.program,d.requestor,c.status_code,C.PRIORITY order by 4 desc;
