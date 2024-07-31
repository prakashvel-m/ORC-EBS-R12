SELECT V.REQUEST_ID "Request Id",
DECODE (V.phase_code,
                 'R', 'Running',
                 'P', 'Inactive',
                 'C', 'Completed',
                 V.phase_code)
            "PHASE",
         DECODE (V.status_code,
                 'E', 'Error',
                 'C', 'Normal',
                 'X', 'Terminated',
                 'Q', 'On Hold',
                 'D', 'Cancelled',
                 'G', 'Warning',
                 'R', 'Normal',
                 'W', 'Paused',
                 'I', 'Paused',
                 V.status_code)
            "STATUS",
TO_CHAR(V.ACTUAL_START_DATE,'DD-MON-YY-HH24:MI:SS') "Start Date",
TO_CHAR(V.ACTUAL_COMPLETION_DATE,'DD-MON-YY-HH24:MI:SS') "Completion Date",
SUBSTR(V.REQUESTOR,1,20) "Requestor",
SUBSTR(V.PROGRAM,1,120) "Program Name"
FROM FND_CONC_REQ_SUMMARY_V V, FND_CONCURRENT_REQUESTS C
WHERE V.REQUEST_ID = C.REQUEST_ID
AND ((V.STATUS_CODE = ('E') and V.phase_code='C')
OR (V.status_code in ('D','X','G')))
--AND trunc(V.ACTUAL_START_DATE) = '07-NOV-21'
--AND V.ACTUAL_START_DATE >= SYSDATE - 1 / 12
AND V.ACTUAL_COMPLETION_DATE >=SYSDATE - 4 / 24 
ORDER BY 4 ASC;
