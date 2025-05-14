SELECT s.inst_id,a.request_id,s.sid,s.serial#,c.spid
  FROM apps.fnd_concurrent_requests a, gv$process c, gv$session s
   WHERE s.sid in ('&sid')
  AND s.paddr = c.addr
  AND a.oracle_process_id = c.spid
  AND a.phase_code = UPPER ('R');
