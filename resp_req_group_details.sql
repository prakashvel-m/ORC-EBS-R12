-- Make use of this quer to check the Resp and its associated request group details

SELECT frv.START_DATE,frv.RESPONSIBILITY_KEY,frv.responsibility_name ,
  frg.request_group_name,frg.REQUEST_GROUP_ID,
  frg.description
   FROM fnd_request_groups frg,
  fnd_responsibility_vl frv
  WHERE frv.request_group_id = frg.request_group_id
  --AND request_group_name LIKE 'US SHRMS Reports % Processes'
AND responsibility_name LIKE 'SCM View Only'
ORDER BY responsibility_name;
