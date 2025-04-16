# Instalar patches pendentes no servidor Windows
# Matheus Antonio da Silva

# Importar módulo do Windows Update
Install-Module PSWindowsUpdate

# Verificar patches pendentes
$pendingUpdates = Get-WUList

# Instalar patches pendentes
$pendingUpdates | Install-WUUpdates -AcceptAll -AutoReboot
