echo OFF

set DestPath=%1
set DeployDir=%2
set WAR_Name=%3

echo ----------------------------
echo Param DestPath=%DestPath%
echo Param DeployDir=%DeployDir%
echo Param WAR_Name=%WAR_Name%
echo ----------------------------

echo copy /y %DeployDir% %DestPath%
copy /y %DeployDir% %DestPath%

echo git add %DestPath% 
git add %DestPath%
echo git commit -m "update %WAR_Name%"
git commit -m "update %WAR_Name%"
echo git push origin HEAD:master
git push origin HEAD:master