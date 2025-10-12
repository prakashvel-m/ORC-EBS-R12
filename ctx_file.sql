SELECT  extractValue(XMLType(TEXT),'//dbhost') VALUE,
extractValue(XMLType(TEXT),'//CURRENT_BASE') BASE,LAST_SYNCHRONIZED
from apps.fnd_oam_context_files
where name not in ('TEMPLATE','METADATA')
and (status is null or status !='H')
and EXTRACTVALUE(XMLType(TEXT),'//file_edition_type')='patch'
--and EXTRACTVALUE(XMLType(TEXT),'//file_edition_type')='run'
and CTX_TYPE = 'A'; 
