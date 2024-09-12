# Função para iniciar os serviços do SharePoint
function Start-SharePointServices {
    Write-Host "Iniciando os serviços do SharePoint..."
    
    # Obtém todos os serviços relacionados ao SharePoint no servidor
    $sharepointServices = Get-Service | Where-Object { $_.DisplayName -like "*SharePoint*" }

    # Inicia todos os serviços do SharePoint
    foreach ($service in $sharepointServices) {
        if ($service.Status -ne "Running") {
            Write-Host "Iniciando o serviço: $($service.DisplayName)"
            Start-Service -Name $service.Name
        } else {
            Write-Host "O serviço $($service.DisplayName) já está em execução."
        }
    }
}

# Função para parar os serviços do SharePoint
function Stop-SharePointServices {
    Write-Host "Parando os serviços do SharePoint..."
    
    # Obtém todos os serviços relacionados ao SharePoint no servidor
    $sharepointServices = Get-Service | Where-Object { $_.DisplayName -like "*SharePoint*" }

    # Para todos os serviços do SharePoint
    foreach ($service in $sharepointServices) {
        if ($service.Status -eq "Running") {
            Write-Host "Parando o serviço: $($service.DisplayName)"
            Stop-Service -Name $service.Name
        } else {
            Write-Host "O serviço $($service.DisplayName) já está parado."
        }
    }
}

# Função para iniciar os serviços do SQL Server
function Start-SQLServices {
    Write-Host "Iniciando os serviços do SQL Server..."

    # Obtém todos os serviços relacionados ao SQL Server no servidor
    $sqlServices = Get-Service | Where-Object { $_.DisplayName -like "*SQL Server*" }

    # Inicia todos os serviços do SQL Server
    foreach ($service in $sqlServices) {
        if ($service.Status -ne "Running") {
            Write-Host "Iniciando o serviço: $($service.DisplayName)"
            Start-Service -Name $service.Name
        } else {
            Write-Host "O serviço $($service.DisplayName) já está em execução."
        }
    }
}

# Função para parar os serviços do SQL Server
function Stop-SQLServices {
    Write-Host "Parando os serviços do SQL Server..."

    # Obtém todos os serviços relacionados ao SQL Server no servidor
    $sqlServices = Get-Service | Where-Object { $_.DisplayName -like "*SQL Server*" }

    # Para todos os serviços do SQL Server
    foreach ($service in $sqlServices) {
        if ($service.Status -eq "Running") {
            Write-Host "Parando o serviço: $($service.DisplayName)"
            Stop-Service -Name $service.Name
        } else {
            Write-Host "O serviço $($service.DisplayName) já está parado."
        }
    }
}

# Menu para o usuário escolher ligar ou desligar os serviços
function Menu {
    Write-Host "Selecione uma opção:"
    Write-Host "1. Iniciar todos os serviços do SharePoint e SQL Server"
    Write-Host "2. Parar todos os serviços do SharePoint e SQL Server"
    Write-Host "3. Sair"
    
    $option = Read-Host "Escolha uma opção (1/2/3)"
    
    switch ($option) {
        1 {
            Start-SharePointServices
            Start-SQLServices
        }
        2 {
            Stop-SharePointServices
            Stop-SQLServices
        }
        3 {
            Write-Host "Saindo do script."
            exit
        }
        default {
            Write-Host "Opção inválida. Tente novamente."
            Menu
        }
    }
}

# Executar o menu para o usuário escolher a ação
Menu
