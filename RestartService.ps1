param(
    [int] $serviceID, #If using a remote computer 0 must be entered to trigger default.
    [string] $machine
)

if ($machine -eq "")
{
    Write-Host "Running locally..." -ForegroundColor Green

    switch ($serviceID) {
        1 {}
        2 {}
        88 {
            Write-Host "Please specify the name of the service you want to restart." -ForegroundColor Green
            $serviceName = Read-Host
            Restart-Service -Name $serviceName -Force
        } 
        Default {
            Write-Host "No service ID was specified, showing all running services by default." -ForegroundColor Green
            Get-Service | Where Status -eq "Running"
        }
    }
}
else {
    Write-Host "Running against" $machine "..." -ForegroundColor DarkYellow
    Write-Host "Are you sure you want to continue? y/n" -ForegroundColor DarkYellow
    $continue = Read-Host

    if (-not($continue.toLower() -eq 'y' )){    
        Write-Host "Aborted." -ForegroundColor DarkYellow
    }else{

        switch ($serviceID) {
            1 {}
            2{}
            88{
                Write-Host "Please specify the name of the service you want to restart." -ForegroundColor Green
                $serviceName = Read-Host
                Restart-Service -Name $serviceName  -ComputerName $machine -Force
            } 
            Default {
                Write-Host "No service ID was specified, showing all running services by default." -ForegroundColor Green
                Get-Service -ComputerName $machine | Where Status -eq "Running"
            }
        }
    }    
}

Write-Host "Script has finnished running." -ForegroundColor Green
Pause