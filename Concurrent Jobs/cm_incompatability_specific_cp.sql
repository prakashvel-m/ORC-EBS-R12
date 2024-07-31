-- TO CHECK THE INCOMPATABILITY OF THE CONCURRENT PROGRAM
SELECT TO_RUN_APPLICATION_ID,
  (SELECT user_concurrent_program_name 
   FROM fnd_concurrent_programs_vl 
   WHERE concurrent_program_id = running_concurrent_program_id 
   AND application_id = running_application_id) Program, 
  (SELECT user_concurrent_program_name 
   FROM fnd_concurrent_programs_vl 
   WHERE concurrent_program_id = to_run_concurrent_program_id 
   AND application_id = to_run_application_id ) InCompatible_Program ,DECODE(TO_RUN_TYPE, 'S', 'Set', 'Program') TYPE,
                DECODE(INCOMPATIBILITY_TYPE, 'G', 'Global', 'Domain') "Incompatibilty Type"
FROM FND_CONCURRENT_PROGRAM_SERIAL  
WHERE (SELECT user_concurrent_program_name 
       FROM fnd_concurrent_programs_vl 
       WHERE concurrent_program_id = running_concurrent_program_id 
       AND application_id = running_application_id) like '%GEWSH Trans shipment outbound program -APL%'
ORDER BY 1;

SELECT distinct fat.application_id,
                to_run_concurrent_program_id,
                fat.APPLICATION_NAME,
                fcpt.user_concurrent_program_name,
                DECODE(TO_RUN_TYPE, 'S', 'Set', 'Program') TYPE,
                DECODE(INCOMPATIBILITY_TYPE, 'G', 'Global', 'Domain') "Incompatibilty Type"
  FROM FND_CONCURRENT_PROGRAM_SERIAL fcps,
       FND_CONCURRENT_PROGRAMS_TL    fcpt,
       FND_APPLICATION_TL            fat
 WHERE fcps.RUNNING_APPLICATION_ID = fat.application_id
   AND fcpt.CONCURRENT_PROGRAM_ID = fcps.TO_RUN_CONCURRENT_PROGRAM_ID
   --AND fcpt.CONCURRENT_PROGRAM_ID in (select CONCURRENT_PROGRAM_ID from FND_CONCURRENT_PROGRAMS where concurrent_program_name='&shortname')
   AND fcpt.LANGUAGE = 'US'
   AND fat.LANGUAGE = 'US'
AND fcpt.user_concurrent_program_name like  '%GEWSH Trans shipment outbound program -APL%'
 ORDER BY 1, 2;
