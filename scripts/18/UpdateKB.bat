echo OFF

set KBPath=%1
echo Param KBPath=%KBPath%
"C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" /t:Update /p:KBPath=%KBPath% buildkb.msbuild
rem msbuild /t:Update /p:KBPath=C:\Models\BUS_HCEN_inus buildkb.msbuild
