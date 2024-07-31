SELECT fpovl.user_profile_option_name,fu.user_name ,fu.description, 
       DECODE(fpov.level_id,10001,'SITE',10002,'APP',10003,'RESP',10004,'USER') "Level",
       fpov.profile_option_value,fu1.description as UPDATED_BY
FROM fnd_profile_option_values fpov, fnd_profile_options_vl fpovl,fnd_user fu , fnd_user fu1 --, fnd_responsibility_vl fr
WHERE fpovl.profile_option_id = fpov.profile_option_id 
AND fpov.level_value = fu.user_id -- User Level
AND fpov.LAST_UPDATED_BY=fu1.user_id 
--AND fpov.level_value = fr.responsibility_id --Responsibility Level
AND fpovl.user_profile_option_name like '%Concurrent:Active Request Limit%'
AND fu.user_name in ('515146398')
