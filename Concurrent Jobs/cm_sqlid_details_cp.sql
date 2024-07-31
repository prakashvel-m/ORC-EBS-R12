program ,fcr.phase_code,fcr.status_code 
from apps.fnd_concurrent_requests a,gv$session b ,apps.fnd_conc_req_summary_v fcr where
b.audsid(+)= a.oracle_session_id and sid in (select sid 
from gv$session where sql_id  in ('4zj353uc96yvw','fyj4hqs5zg5wx','fyj4hqs5zg5wx') ) and a.request_id=fcr.request_id;
