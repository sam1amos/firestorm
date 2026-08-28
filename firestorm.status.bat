@echo off

@REM Set Paths.
SET GIT="D:\Program Files (x86)\MinGit\cmd\git.exe"
SET FIRESTORM="D:\Program Files (x86)\The War Within"

@REM Push into the FIRESTORM folder.
pushd %FIRESTORM%

@REM Display the current status.
%GIT% status

@REM Pop out of the FIRESTORM folder.
popd

@REM Wait for key press.
PAUSE
