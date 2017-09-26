param([string]$ComputerName = 'localhost',[datetime]$StartTimestamp,[datetime]$EndTimestamp)

$Logs = (Get-WinEvent -ListLog Application -ComputerName $ComputerName | where { $_.RecordCount }).LogName
$FilterTable = @{
	'StartTime' = $StartTimestamp
	'EndTime' = $EndTimestamp
	'LogName' = $Logs
    'ProviderName' = 'MSSQLSERVER'

}
		
Get-WinEvent -ComputerName $ComputerName -FilterHashtable $FilterTable | Out-GridView