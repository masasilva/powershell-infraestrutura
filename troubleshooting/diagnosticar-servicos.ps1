# Diagnóstico de serviços críticos no Windows Server
# Matheus Antonio da Silva

# Definir lista de serviços críticos
$services = @(
    "wuauserv",  # Windows Update
    "Spooler",   # Spooler de Impressão
    "Netlogon",  # Logon de Rede
    "BITS"       # Transferência em segundo plano
)

# Verificar status de cada serviço
$servicesStatus = $services | ForEach-Object {
    $service = Get-Service -Name $_
    [PSCustomObject]@{
        ServiceName = $service.Name
        Status = $service.Status
    }
}

# Exibir status dos serviços
$servicesStatus | Format-Table
