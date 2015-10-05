
REM Loop Over Files Marked Changed By Git
:main
FOR /F "delims=" %%I IN ('git diff --name-only') DO (
  CALL :modFile %%I
)
GOTO :EOF


REM Add an Empty Line to End of File
:modFile
ECHO. >> %~f1
GOTO :EOF