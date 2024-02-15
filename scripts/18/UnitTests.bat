echo OFF

set KBPath=%1
echo Param KBPath=%KBPath%
"C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe" buildkb.msbuild /t:RunUnitTests /p:KBPath=%KBPath%;JUnitTestFilePath=".\result"