# Testar latência de servidores DNS na rede
# Matheus Antonio da Silva

# Definir lista de servidores DNS
$dnsServers = @("8.8.8.8", "8.8.4.4", "1.1.1.1")

# Testar latência de cada servidor DNS
$dnsLatency = $dnsServers | ForEach-Object {
    $pingResult = Test-Connection -ComputerName $_ -Count 5 -Quiet
    [PSCustomObject]@{
        DNS = $_
        Latency = ($pingResult.ResponseTime | Measure-Object -Minimum).Minimum
    }
}

# Exibir resultados
$dnsLatency | Format-Table
