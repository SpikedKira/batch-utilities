@ECHO OFF
REM does not currently contain a help section
REM will use branch name as closing number unless you pass in a string to use


:main
REM Get the Root Path for Git Project
SET rootPath=
FOR /F "delims=" %%I IN ('git rev-parse --show-toplevel') DO SET rootPath=%%I

REM Get Just Last Folder in Path
SET rootFolder=
FOR %%F IN (%rootPath%) DO SET rootFolder=%%~nxF

REM Get Current Branch Name
SET branch=
FOR /F "delims=" %%I IN ('git rev-parse --abbrev-ref HEAD') DO SET branch=%%I

REM Check if Branch Was Passed in
IF NOT [%1] == [] (
  SET branch=%1
)

git commit -m "Closes softlayer/%rootFolder%#%branch%"
GOTO :EOF