@ECHO OFF


REM Check For Proper Parameters
REM If Param #1 is a valid path
IF EXIST %~f1 (
  GOTO main
)
GOTO help


:main
setx /M path "%~f1;%PATH%"
npm config set prefix "%~f1" -g
npm install -g npm@2.14.4
npm cache clean
npm config set cache "%~f1\npm-cache" -g
GOTO :EOF


:help
REM Display Help Info Here
echo Moves your npm install to another location.
echo.
echo %~n0 destination
echo.
echo   destination      Specifies the path to move the npm install to
echo.
echo This command will modify your PATH environment variable and may need to be run as an Administrator.
echo.
echo Run this command after a fresh Node install.
GOTO :EOF