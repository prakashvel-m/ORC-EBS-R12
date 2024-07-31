#Concurrent Programs:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcpprog.lct concurrent_program.ldt PROGRAM APPLICATION_SHORT_NAME="app_short_name" CONCURRENT_PROGRAM_NAME="concurrent_program_name"

FNDLOAD apps/$appspw O Y UPLOAD $FND_TOP/patch/115/import/afcpprog.lct /backup/mprakashvel/FILE_MIGRATION/concurrent_program.ldt CUSTOM_MODE=FORCE


#Request Groups:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcpreqg.lct request_group.ldt REQUEST_GROUP REQUEST_GROUP_NAME="request_group_name" APPLICATION_SHORT_NAME="app_short_name"

#Request Sets:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcprset.lct request_set.ldt REQUEST_SET APPLICATION_SHORT_NAME="app_short_name" REQUEST_SET_NAME="request_set_name"

FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcprset.lct request_set_links.ldt FND_REQUEST_SET_LINKS APPLICATION_SHORT_NAME="AR" REQUEST_SET_NAME="FNDRSSUB2177"

FNDLOAD apps/$appspw O Y UPLOAD $FND_TOP/patch/115/import/afcprset.lct /backup/mprakashvel/FILE_MIGRATION/request_set_links.ldt CUSTOM_MODE=FORCE

#Responsibilities:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afscursp.lct responsibility.ldt FND_RESPONSIBILITY RESP_KEY="responsibility_key"

#Menus and Submenus:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afscursc.lct menu.ldt MENU MENU_NAME="menu_name"

#Forms and Form Functions:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afscursm.lct form_function.ldt FUNCTION FUNCTION_NAME="function_name"

#Data Groups:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afscursb.lct data_group.ldt FND_DATA_GROUP DATA_GROUP_NAME="data_group_name" APPLICATION_SHORT_NAME="app_short_name"

#Profile Options:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcpb.lct profile_option.ldt PROFILE PROFILE_NAME="profile_name"

#User Accounts:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afscursp.lct user.ldt FND_USER USER_NAME=515124996

FNDLOAD apps/$appspw 0 Y UPLOAD $FND_TOP/patch/115/import/afscursp.lct user.ldt

Replace "$appspw", "app_short_name", "concurrent_program_name", "request_group_name", "request_set_name", "responsibility_key", "menu_name", "function_name", "data_group_name", "profile_name", and "user_name" with your actual values.

