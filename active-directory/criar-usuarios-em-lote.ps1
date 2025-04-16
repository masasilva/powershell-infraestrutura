# Criação em massa de usuários no AD
# Entrada: CSV com Nome, Sobrenome, Login

Import-Csv .\usuarios.csv | ForEach-Object {
    $SamAccountName = $_.Login
    $NomeCompleto = "$($_.Nome) $($_.Sobrenome)"
    $Senha = ConvertTo-SecureString "Senha123!" -AsPlainText -Force

    New-ADUser -Name $NomeCompleto `
               -SamAccountName $SamAccountName `
               -UserPrincipalName "$SamAccountName@empresa.com" `
               -AccountPassword $Senha `
               -Enabled $true `
               -Path "OU=Colaboradores,DC=empresa,DC=com"
}
