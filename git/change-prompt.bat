@echo off

REM Full Current Directory Path
SET fullPath=%cd%

REM Get the Root Path for Git Project
SET rootPath=
FOR /F "delims=" %%I IN ('git rev-parse --show-toplevel 2^>nul') DO SET rootPath=%%I


REM Check for Fatal
IF "%rootPath%" == "" (
  PROMPT $P$G
  TITLE %fullPath%
  exit /b
)


REM Get Drive and Path
SET rootFolder=
FOR %%F IN (%rootPath%) DO SET rootFolder=%%~dpF

REM Get Just Last Folder in Path
SET projectName=
FOR %%F IN (%rootPath%) DO SET projectName=%%~nxF

REM Get Current Branch Name
SET branch=
FOR /F "delims=" %%I IN ('git rev-parse --abbrev-ref HEAD') DO SET branch=%%I


REM Remove Path and Project from Full Path
CALL SET projectPath=%%fullPath:%rootFolder%=%%
CALL SET projectPath=%%projectPath:%projectName%=%%


PROMPT (%projectName% @ %branch%) %projectPath%$G

TITLE %projectName%