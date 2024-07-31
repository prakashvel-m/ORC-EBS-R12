select PHASE_code,status_code,request_id,parent_request_id,
to_char(a.actual_start_Date,'DD/MM/YY HH24:MI') actual_start_Date,
to_char(a.actual_completion_Date,'DD/MM/YY HH24:MI') actual_completion_Date,
to_char(a.requested_start_date,'DD/MM/YY HH24:MI') requested_start_date,
to_char(a.request_date,'DD/MM/YY HH24:MI') request_date,
requestor,
Round((nvl(actual_completion_Date,sysdate)-actual_start_Date)*24*60,2) time_taken ,program,argument_text,priority_request_id from apps.fnd_conc_req_summary_v a
where 1=1
and
program like '%program%'
--program like '%GEMSC Push Non onhand supply – APL%'
-- program like '%GEWSH SDS Delivery Creation and OTM Integration Req Set%'
--request_id in (1291471196);  
--and program like '%GEWSH SDS Delivery Creation and OTM Integration Req Set%'
--and argument_text like '%N%'
--and program like '%GEWSH Directs Delivery Creation and OTM Integration Req Set%'
--and phase_code not in ('C') -- E (Error), D(Cancelled)
--and phase_code in ('C')
order by a.request_id desc;
