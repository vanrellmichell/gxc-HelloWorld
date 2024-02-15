echo OFF

set KBPath=%1
echo -- ReviewCommits --
echo ----------------------------
echo Param KBPath=%KBPath%
echo ----------------------------


"C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe" KBDoctor.msbuild /t:ReviewCommits /p:KBPath=%KBPath% /p:ServerUser=local\consolidado /p:ServerPassword=consolidado123 > C:\_result\logReviewCommits.txt