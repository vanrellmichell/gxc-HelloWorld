$fecha = Get-Date

$auxFecha = $fecha.ToString().Replace(' ','').Replace(':','-').Replace('/','-')

New-Item -Path "..\result\$auxFecha" -ItemType Directory

Move-Item -Path ..\result\*.xml -Destination ..\result\$auxFecha

Invoke-Expression -Command "java -jar ..\unitth\unitth.jar ..\result\*"

Compress-Archive -Path ..\unitth\report.th\* -CompressionLevel Fastest -DestinationPath ..\unitth\report.zip

$user = "notificaciones.bus@salud.gub.uy"

$pass = ConvertTo-SecureString "Rptrte9tplEwwjmj" -AsPlainText -Force

$credentials = New-Object System.Management.Automation.PSCredential $user, $pass

$attachments = "..\result\logReviewCommits.txt","..\unitth\report.zip"

Send-MailMessage -From "notificaciones.bus@salud.gub.uy" -To "notificaciones.bushcen@agesic.gub.uy" -Subject "Notificaciones BUS HCEN" -Body "Se adjunta reporte historico de ejecucion de pruebas y reporte de calidad del codigo." -Attachments $attachments -Credential $credentials -SmtpServer "10.253.10.25" -Port 587

Remove-Item -Path '..\unitth\report.zip'

# https://blogs.msdn.microsoft.com/koteshb/2010/02/12/powershell-how-to-create-a-pscredential-object/
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/send-mailmessage?view=powershell-6
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/compress-archive?view=powershell-6
# https://stackoverflow.com/questions/36385416/exception-calling-send-with-1-arguments-the-remote-certificate-is-invali

# posibles puertos: 587, 465, 25, hay otro smtp server que es en vez de correo.agesic.gub.uy smtp.agesic.gub.uys