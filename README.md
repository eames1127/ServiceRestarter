# ServiceRestarter

## About
A PowerShell script that can restart specific service(s) locally or remotely.
The script can also be used to see what services are currently running locally or on a server.

## Prerequisites
To be able to use this script you must have the following:

1. Administrator privileges in PowerShell.
2. The ability to run PowerShell scripts on the machine running the script.
(set-executionpolicy remotesigned)

To be able to use the script against a server you must also have access to that server.

## How to run the script
Navigate to the ps1 file's directory and enter the script's name whilst passing the custom ID of the service.
If the script is being used to restart a service on a server simply add the server's name after the ID, otherwise simply leave this blank to run locally.

```PowerShell {cmd="node"}
".\RestartService.ps1 <ID> "<SERVERNAME>""
```
e.g. for a server
```PowerShell {cmd="node"}
".\RestartService.ps1 1 "MyServer""
```
e.g. locally
```PowerShell {cmd="node"}
".\RestartService.ps1 1"
```

If using the default commands simply call the script leaving the ID parameter empty, for a server 0 will act as the default.

e.g. for a server
```PowerShell {cmd="node"}
".\RestartService.ps1 0 ""MyServer""
```
e.g. locally
```PowerShell {cmd="node"}
".\RestartService.ps1"
```

## Warning
Do not use this script unless you understand the service(s) you are restarting. Stopping a critical service may have undesired affects of which the owner of this script will not bare responsibility.