# Exportar informações de hardware dos computadores
# Matheus Antonio da Silva

# Obter informações de hardware usando WMI
$computers = Get-WmiObject -Class Win32_ComputerSystem

# Obter informações sobre processadores
$cpu = Get-WmiObject -Class Win32_Processor

# Exportar para um arquivo CSV
$computers | Select-Object Name, Manufacturer, Model, TotalPhysicalMemory |
    Export-Csv -Path "C:\Relatorios\Hardware_Inventory.csv" -NoTypeInformation

$cpu | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors |
    Export-Csv -Path "C:\Relatorios\CPU_Inventory.csv" -NoTypeInformation
