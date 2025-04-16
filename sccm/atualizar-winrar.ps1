# Atualiza o WinRAR via SCCM
# Matheus Antonio da Silva

$AppName = "WinRAR"
$NewVersion = "6.24"
$SourcePath = "\\servidor\SCCM\Pacotes\WinRAR\$NewVersion"
$DeployCollection = "Workstations - Produção"

# 1. Importar módulo do SCCM
Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1"
Set-Location "SCCM:"

# 2. Criar nova aplicação
New-CMApplication -Name "$AppName $NewVersion" -AutoInstall $true

# 3. Distribuir e implantar
Start-CMContentDistribution -ApplicationName "$AppName $NewVersion" -DistributionPointGroupName "Todos DPs"
Start-CMApplicationDeployment -CollectionName $DeployCollection -Name "$AppName $NewVersion" -DeployAction Install -DeployPurpose Available
