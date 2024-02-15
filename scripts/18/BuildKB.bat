echo OFF

set KBPath=%1
set ObjectName=%2
echo ----------------------------
echo Param KBPath=%KBPath%
echo Param ObjectName=%ObjectName%
echo ----------------------------

"C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe" /t:BuildOne /p:KBPath=%KBPath%;ObjectName=%ObjectName% buildkb.msbuild

echo ErrorLevel %ERRORLEVEL%
set BUILD_STATUS=%ERRORLEVEL%
if %BUILD_STATUS%==0 echo Build success
if not %BUILD_STATUS%==0  EXIT 999
