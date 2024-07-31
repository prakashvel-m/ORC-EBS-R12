-- TO CHECK RESPONSIBITIES OF THE USER 

SELECT fu.user_name USER_SSO,fu.description as USERNAME, fr.responsibility_name, furg.start_date, furg.end_date,furg.LAST_UPDATE_DATE,fu1.USER_NAME as SSO,fu1.description as UPDATED_BY
FROM fnd_user_resp_groups_direct furg
JOIN fnd_user fu ON furg.user_id = fu.user_id 
JOIN fnd_user fu1 on furg.LAST_UPDATED_BY = fu1.user_id
JOIN fnd_responsibility_vl fr ON furg.responsibility_id = fr.responsibility_id
WHERE fu.user_name = '515137378';


-- TO CHECK ROLES OF THE USER

Select wlur.USER_NAME,wfr.display_name,wlur.ROLE_NAME,wrh.super_name,wfr.description,wlur.ASSIGNMENT_REASON,wrh.relationship_id,
wlur.START_DATE,wlur.EXPIRATION_DATE,wlur.EFFECTIVE_START_DATE,wlur.EFFECTIVE_END_DATE
from APPS.WF_LOCAL_USER_ROLES wlur,
APPS.WF_ROLE_HIERARCHIES wrh,
apps.UMX_ALL_ROLE_VL wfr
WHERE 1=1
AND wlur.role_name = wrh.sub_name (+)
and wfr.name = wlur.role_name
and wlur.USER_NAME = '502362397' -- USER NAME
and sysdate between wlur.EFFECTIVE_START_DATE and wlur.EFFECTIVE_END_DATE
--and wfr.display_name like 'Receivables - Limited Access' ---- Responsibility Name
-- and role_name ='FND_RESP|SQLGL|AMZ_GL_LOOK_CODE_MGR|STANDARD' -- Role Name
order by wlur.ROLE_NAME

  
-- TO CHECK USERS WITH SPECIFIC RESPONSIBLITY

SELECT fu.user_name as SSO,fu.description NAME,fu.email_address, fr.responsibility_name, furg.start_date, furg.end_date
FROM fnd_user_resp_groups_direct furg
JOIN fnd_user fu ON furg.user_id = fu.user_id
JOIN fnd_responsibility_vl fr ON furg.responsibility_id = fr.responsibility_id
WHERE fr.responsibility_name like '%Setup%' and furg.END_DATE is NULL;
