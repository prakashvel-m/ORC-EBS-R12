-- STOP WORKFLOW NOTIFICATION MAILER

declare
p_retcode number;
p_errbuf varchar2(100);
m_mailerid fnd_svc_components.component_id%TYPE;
begin
select component_id
into m_mailerid
from fnd_svc_components
where component_name = ‘Workflow Notification Mailer’;
fnd_svc_component.stop_component(m_mailerid, p_retcode, p_errbuf);
commit;
end;
/

-- START WORKFLOW NOTIFICATION MAILER

declare
p_retcode number;
p_errbuf varchar2(100);
m_mailerid fnd_svc_components.component_id%TYPE;
begin
select component_id
into m_mailerid
from fnd_svc_components
where component_name = ‘Workflow Notification Mailer’;
fnd_svc_component.start_component(m_mailerid, p_retcode, p_errbuf);
commit;
end;
/
