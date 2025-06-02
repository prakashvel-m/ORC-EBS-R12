/* 
10000	ECX Inbound Agent Listener	                          WF_AGENT_LISTENER
10001	ECX Transaction Agent Listener	                      WF_AGENT_LISTENER
10002	Workflow Deferred Agent Listener	                    WF_AGENT_LISTENER
10003	Workflow Deferred Notification Agent Listener	        WF_AGENT_LISTENER
10004	Workflow Error Agent Listener	                        WF_AGENT_LISTENER
10005	Workflow Inbound Notifications Agent Listener	        WF_AGENT_LISTENER
10006	Workflow Notification Mailer	                        WF_MAILER
10020	Web Services OUT Agent	                              WF_DOCUMENT_WEB_SERVICES
10021	Web Services IN Agent	                                WF_JAVA_AGENT_LISTENER
10022	Workflow Java Deferred Agent Listener	                WF_JAVA_AGENT_LISTENER
10023	Workflow Java Error Agent Listener	                  WF_JAVA_AGENT_LISTENER
10040	WF_JMS_IN Listener(M4U)	                              WF_JAVA_AGENT_LISTENER
10041	Workflow Inbound JMS Agent Listener	                  WF_AGENT_LISTENER
12041	Push Notification Provider	                          FND_MCS_PUSH_NTF_PROVIDER
*/


select c.component_id, c.component_name,c.component_type, p.parameter_id, p.parameter_name, v.parameter_value value 
from apps.fnd_svc_comp_param_vals_v v, apps.fnd_svc_comp_params_b p, apps.fnd_svc_components c 
where c.component_type = 'WF_MAILER' --
-- and c.c.component_type = 'WF_AGENT_LISTEN'
 and v.component_id = c.component_id and v.parameter_id = p.parameter_id 
and p.parameter_name in ( 'INBOUND_SERVER','ACCOUNT', 'REPLYTO','OUTBOUND_SERVER') 
order by c.component_id, c.component_name,p.parameter_name;
