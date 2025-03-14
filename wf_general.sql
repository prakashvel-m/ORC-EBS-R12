Select wlur.USER_NAME,wfr.display_name,wlur.ROLE_NAME,wrh.super_name,wfr.description,wlur.ASSIGNMENT_REASON,wrh.relationship_id,
wlur.START_DATE,wlur.EXPIRATION_DATE,wlur.EFFECTIVE_START_DATE,wlur.EFFECTIVE_END_DATE
from APPS.WF_LOCAL_USER_ROLES wlur,
APPS.WF_ROLE_HIERARCHIES wrh,
apps.UMX_ALL_ROLE_VL wfr
WHERE 1=1
AND wlur.role_name = wrh.sub_name (+)
and wfr.name = wlur.role_name
and wlur.USER_NAME like '%WF_USER_ROLE_API_TEST1%' -- USER NAME
and sysdate between wlur.EFFECTIVE_START_DATE and wlur.EFFECTIVE_END_DATE
--and wfr.display_name like 'Receivables - Limited Access' ---- Responsibility Name
-- and role_name ='FND_RESP|SQLGL|AMZ_GL_LOOK_CODE_MGR|STANDARD' -- Role Name
order by wlur.ROLE_NAME;


select * from apps.WF_LOCAL_USER_ROLES;

select * from apps.WF_ROLE_HIERARCHIES;

select * from apps.UMX_ALL_ROLE_VL;


select * from APPS.Per_all_people_f;

SELECT COUNT(1),
       a.msg_state, 
       a.user_data.event_name, 
       a.user_data.send_date
FROM applsys.aq$wf_deferred a
WHERE a.user_data.event_name LIKE '%oracle.apps.fnd.wf.ds%' --Business event name
AND a.user_data.send_date > SYSDATE - 1
GROUP BY a.msg_state, a.user_data.event_name, a.user_data.send_date
ORDER BY 1, 2 ;

select corrid,count(*) from apps.wf_deferred where TIME_MANAGER_INFO > sysdate-1 group by corrid;

select * from apps.wf_event_subscriptions 
where EVENT_FILTER_GUID='<ID>';
