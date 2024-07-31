select
concurrent_program_name,user_concurrent_program_name
from 
fnd_concurrent_programs_vl b 
where
user_concurrent_program_name like '%user_concurrent_program_name%';

select
c.program_short_name,c.program,b.user_concurrent_program_name
from 
fnd_concurrent_programs_vl b,FND_CONC_REQ_SUMMARY_V c
where
c.program_short_name=b.concurrent_program_name
and b.user_concurrent_program_name like '%user_concurrent_program_name%';

select 
a.lookup_type,
a.lookup_code,
a.enabled_flag,
a.description,
b.user_concurrent_program_name,
a.attribute1 as Fail_Flag,
a.attribute2 as Run_Time_Flag,
a.attribute4 as Run_Time_Threshold,
a.attribute7 as On_Hold_Notification_Flag
from 
FND_LOOKUP_VALUES_VL a,
fnd_concurrent_programs_vl b 
where 
lookup_type = 'GEFND_JOB_MONITOR_LT' 
and b.concurrent_program_name = a.lookup_code
and b.user_concurrent_program_name like '%user_concurrent_program_name%';
--and lookup_code = 'GEARCCUPSETPROG';
