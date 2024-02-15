echo OFF

set WAR_Path_From=%1
set WAR_Path_To=%2
set WAR_Name=%3
set RemoteHost=%4

echo Param WAR_Path_From=%WAR_Path_From%
echo Param WAR_Path_To=%WAR_Path_To%
echo Param WAR_Name=%WAR_Name%
echo Param RemoteHost=%RemoteHost%

echo scp %WAR_Path_From% %RemoteHost%:%WAR_Path_To%%WAR_Name%
scp %WAR_Path_From% %RemoteHost%:%WAR_Path_To%%WAR_Name%

echo ssh %RemoteHost% "sudo /opt/wildfly/bin/jboss-cli.sh --connect --controller=10.237.18.20 --command=""undeploy --name=%WAR_Name% --server-groups=full-ha-server-group"" "
ssh %RemoteHost% "sudo /opt/wildfly/bin/jboss-cli.sh --connect --controller=10.237.18.20 --command=""undeploy --name=%WAR_Name% --server-groups=full-ha-server-group"" "

echo ssh %RemoteHost% "sudo /opt/wildfly/bin/jboss-cli.sh --connect --controller=10.237.18.20 --command=""deploy %WAR_Path_To%%WAR_Name%  --server-groups=full-ha-server-group --name=%WAR_Name% --runtime-name=%WAR_Name%"" "
ssh %RemoteHost% "sudo /opt/wildfly/bin/jboss-cli.sh --connect --controller=10.237.18.20 --command=""deploy %WAR_Path_To%%WAR_Name%  --server-groups=full-ha-server-group --name=%WAR_Name% --runtime-name=%WAR_Name%"" "
