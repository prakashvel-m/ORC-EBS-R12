#Request Sets:
FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcprset.lct request_set.ldt REQUEST_SET APPLICATION_SHORT_NAME="app_short_name" REQUEST_SET_NAME="request_set_name"

FNDLOAD apps/$appspw 0 Y DOWNLOAD $FND_TOP/patch/115/import/afcprset.lct request_set_links.ldt FND_REQUEST_SET_LINKS APPLICATION_SHORT_NAME="GEAR" REQUEST_SET_NAME="FNDRSSUB2177"

FNDLOAD apps/$appspw O Y UPLOAD $FND_TOP/patch/115/import/afcprset.lct /geabackup/mprakashvel/FILE_MIGRATION/GEOZF_WKD_NON_LUMPSUM_ACCRUAL_RQS_LINK.ldt CUSTOM_MODE=FORCE
