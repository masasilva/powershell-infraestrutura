# Inventário de IPs e MACs na rede
# Matheus Antonio da Silva

# Definir intervalo de IPs para escaneamento
$ipRange = "192.168.1.1..192.168.1.254"
$inventory = @()

# Escanear todos os IPs no intervalo
foreach ($ip in $ipRange) {
    $mac = (Test-Connection -ComputerName $ip -Count 1 -Quiet)
    if ($mac) {
        $macAddress = (Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPAddress='$ip'").MACAddress
        $inventory += [PSCustomObject]@{
            IPAddress = $ip
            MACAddress = $macAddress
        }
    }
}

# Salvar inventário em CSV
$inventory | Export-Csv -Path "C:\Relatorios\IP_MAC_Inventory.csv" -NoTypeInformation
