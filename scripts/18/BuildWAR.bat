echo OFF

set GX_PROGRAM_DIR=C:\Program Files (x86)\GeneXus\GeneXus18U5

set KBPath=%1
set ProjFullPath=%2
set ProjectName=%3
set AppName=%4
set ObjectNames=%5
set Additionals=%6
set OutputWar=%7
rem set ProjFullPath=%KBPath%\\%DataDir%\\web\\%ProjectName%.gxdproj
rem set OutputWar=%KBPath%\\%DataDir%\\Deploy\\Local\\%ProjectName%.war
rem set Additionals=C:\_additionalFiles\atna\atna_additionals.gxdproj
rem set ApplicationServer="Generic Servlet 3.1"

echo ------- Input Params --------
echo Param KBPath=%KBPath%
echo Param DataDir=%DataDir%
echo Param ProjectName=%ProjectName%
echo Param AppName=%AppName%
echo Param ObjectNames=%ObjectNames%
echo Param Additionals=%Additionals%
echo -----------------------------
echo ------- Variables -----------
echo Var ApplicationServer=%ApplicationServer%
echo Var ProjFullPath=%ProjFullPath%
echo Var OutputWar=%OutputWar%
echo -----------------------------
echo

"C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe" deploy.msbuild /p:ProjectName=%ProjectName%;KBPath=%KBPath%;ObjectNames=%ObjectNames%

"C:\Program Files (x86)\MSBuild\14.0\Bin\msbuild.exe" %ProjFullPath% /p:AppName=%AppName%;AdditionalItems=%Additionals%
