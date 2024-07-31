#Download the user
FNDLOAD apps/<password> 0 Y DOWNLOAD $FND_TOP/patch/115/import/afscursp.lct <username>.ldt FND_USER USER_NAME=<username>
#Upload the user
FNDLOAD apps/<password> 0 Y UPLOAD $FND_TOP/patch/115/import/afscursp.lct <username>.ldt
