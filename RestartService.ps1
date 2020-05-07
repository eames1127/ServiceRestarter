param(
    [int] $serviceID, #If using a remote computer 0 must be entered to trigger default.
    [string] $machine
)

if ($machine -eq "")
{
    Write-Host "Running locally..." -ForegroundColor Green
    switch ($serviceID) {
        1 {
            #example method to restart the printer spooler for Windows
            Restart-Service -Name "Spooler" -Force
        }
        2{
            #Add service name here to restart service when an ID of two is sent
        }
        88 {
            Write-Host "Please specify the name of the service you want to restart." -ForegroundColor Green
            $serviceName = Read-Host
            Restart-Service -Name $serviceName -Force
        } 
        Default {
            Write-Host "No service ID was specified, showing all running services by default." -ForegroundColor Green
            Pause
            Get-Service | Where-Object Status -eq "Running"
        }
    }
}
else 
{
    Write-Host "Running against" $machine "..." -ForegroundColor DarkYellow
    Write-Host "Are you sure you want to continue? y/n" -ForegroundColor DarkYellow
    $continue = Read-Host

    if (-not($continue.toLower() -eq 'y' )){    
        Write-Host "Aborted." -ForegroundColor DarkYellow
    }
    else
    {
        switch ($serviceID) 
        {
            1 {
                #example method to restart the printer spooler for Windows on a server.
                Restart-Service -Name "Spooler" -ComputerName $machine -Force
            }
            2{
                #Add service name here to restart service when an ID of two is sent, be sure to include the machine name.
            }
            88{
                Write-Host "Please specify the name of the service you want to restart." -ForegroundColor DarkYellow
                $serviceName = Read-Host
                Restart-Service -Name $serviceName  -ComputerName $machine -Force
            } 
            Default {
                Write-Host "No service ID was specified, showing all running services by default." -ForegroundColor DarkYellow
                Pause
                Get-Service -ComputerName $machine | Where-Object Status -eq "Running"
            }
        }
    }    
}
Write-Host "The script has finished running." -ForegroundColor Green
Pause