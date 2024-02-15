$fecha = Get-Date

$auxFecha = $fecha.ToString().Replace(' ','').Replace(':','-').Replace('/','-')

New-Item -Path "C:\_result\$auxFecha" -ItemType Directory

Move-Item -Path C:\_result\*.xml -Destination C:\_result\$auxFecha

Invoke-Expression -Command "java -jar C:\_unitth\unitth.jar C:\_result\*"

Compress-Archive -Path C:\_unitth\report.th\* -CompressionLevel Fastest -DestinationPath C:\_unitth\report.zip

$user = "notificaciones.bus@agesic.gub.uy"

$pass = ConvertTo-SecureString "Notificaciones.2019" -AsPlainText -Force

$credentials = New-Object System.Management.Automation.PSCredential $user, $pass

$attachments = "C:\_result\logReviewCommits.txt","C:\_unitth\report.zip"

Send-MailMessage -From "notificaciones.bus@agesic.gub.uy" -To "notificaciones.bushcen@agesic.gub.uy" -Subject "Notificaciones BUS HCEN" -Body "Se adjunta reporte historico de ejecucion de pruebas y reporte de calidad del codigo." -Attachments $attachments -Credential $credentials -SmtpServer "correo.agesic.gub.uy" -Port 25

Remove-Item -Path 'C:\_unitth\report.zip'

# https://blogs.msdn.microsoft.com/koteshb/2010/02/12/powershell-how-to-create-a-pscredential-object/
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/send-mailmessage?view=powershell-6
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/compress-archive?view=powershell-6
# https://stackoverflow.com/questions/36385416/exception-calling-send-with-1-arguments-the-remote-certificate-is-invali

# posibles puertos: 587, 465, 25, hay otro smtp server que es en vez de correo.agesic.gub.uy smtp.agesic.gub.uys