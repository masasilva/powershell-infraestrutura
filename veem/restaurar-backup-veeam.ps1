# Restaurar backup Veeam
# Matheus Antonio da Silva

# Importar módulo do Veeam
Import-Module Veeam.Backup.PowerShell

# Conectar ao servidor Veeam
$server = "VeeamServer"
Connect-VBRServer -Server $server

# Selecionar job de backup
$job = Get-VBRBackup | Where-Object {$_.Name -eq "BackupJobName"}

# Restaurar última versão
Restore-VBRBackup -RestorePoint $job | Start-VBRRestore

# Desconectar do servidor Veeam
Disconnect-VBRServer
