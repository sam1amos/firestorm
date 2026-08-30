@echo off

@REM Create a Timestamp.
SET HOUR=%TIME:~0,2%
SET TIMESTAMP=%DATE:~0,4%-%DATE:~5,2%-%DATE:~8,2%_%HOUR: =0%.%TIME:~3,2%.%TIME:~6,2%

@REM Set Paths.
SET GIT="D:\Program Files (x86)\MinGit\cmd\git.exe"
SET ZIP="D:\Program Files\7-Zip\7z.exe"

@REM Set FIRESTORM Paths.
SET FIRESTORM="D:\Program Files (x86)\The War Within"
SET FIRESTORM_INTERFACE="Interface"
SET FIRESTORM_WTF="WTF"
SET FIRESTORM_ACCOUNT_SAM_AMOS="sam.amos@gmail.com"
SET FIRESTORM_ACCOUNT_ARKARIA_SHADOWMAID="arkariashadowmaid@gmail.com"
SET FIRESTORM_FILE=Z:\backup\firestorm\firestorm.%TIMESTAMP%.7z

@REM Push into the FIRESTORM folder.
pushd %FIRESTORM%

@REM Delete all .bak files.
del /s /q *.bak

@REM Add the modified .gitignore file.
%GIT% add .gitignore

@REM Add all the modified .bat files.
%GIT% add *.bat

@REM Add the modified Config.wtf file.
%GIT% add %FIRESTORM_WTF%\Config.wtf

@REM Add the modified files from FIRESTORM_WTF\Account\FIRESTORM_ACCOUNT_SAM_AMOS
%GIT% add %FIRESTORM_WTF%\Account\\%FIRESTORM_ACCOUNT_SAM_AMOS%

@REM Add the modified files from FIRESTORM_WTF\Account\FIRESTORM_ACCOUNT_ARKARIA_SHADOWMAID
%GIT% add %FIRESTORM_WTF%\Account\\%FIRESTORM_ACCOUNT_ARKARIA_SHADOWMAID%

@REM Commit the updates including the timestamp in the message.
%GIT% commit -m "Firestorm Backup: %TIMESTAMP%"

@REM Push the updates to the remote repository.
%GIT% push

@REM Compress the Interface and WTF folders excluding the .sync folders.
%ZIP% a %FIRESTORM_FILE% ^
  %FIRESTORM_INTERFACE% ^
    -x!%FIRESTORM_INTERFACE%\.sync ^
  %FIRESTORM_WTF%\Account\%FIRESTORM_ACCOUNT_SAM_AMOS% ^
    -x!%FIRESTORM_WTF%\Account\%FIRESTORM_ACCOUNT_SAM_AMOS%\.sync ^
  %FIRESTORM_WTF%\Account\%FIRESTORM_ACCOUNT_ARKARIA_SHADOWMAID% ^
    -x!%FIRESTORM_WTF%\Account\%FIRESTORM_ACCOUNT_ARKARIA_SHADOWMAID%\.sync

@REM Pop out of the FIRESTORM folder.
popd

@REM Wait for key press.
PAUSE
