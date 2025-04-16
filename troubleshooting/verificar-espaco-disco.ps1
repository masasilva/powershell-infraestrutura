# Verificar uso de espaço em disco no servidor
# Matheus Antonio da Silva

# Obter status de uso de espaço em disco
$disks = Get-WmiObject Win32_LogicalDisk -Filter "DriveType = 3"

# Exibir uso de espaço
$disks | Select-Object DeviceID, @{Name="Tamanho (GB)"; Expression={"{0:N2}" -f ($_.'Size'/1GB)}}, @{Name="Espaço Livre (GB)"; Expression={"{0:N2}" -f ($_.'FreeSpace'/1GB)}}, @{Name="Uso (%)"; Expression={"{0:N2}" -f (($_.'Size' - $_.'FreeSpace') / $_.'Size' * 100)}}
