select distinct s.blocking_session,s.sid "SID",s.logon_time,s.SQL_EXEC_START,s.status,s.inst_id, s.serial# "Serial#",s.sql_hash_value, p.spid "Server Process ID",
vs.sql_id,vs.sql_text
from apps.fnd_concurrent_requests f, gv$session s, gv$process p, gv$sql vs
where f.request_id in (1480100538)
and f.oracle_process_id = p.spid
and p.addr = s.paddr
and s.sql_id = vs.sql_id(+);
