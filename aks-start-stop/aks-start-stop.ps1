Param
(
	[Parameter (Mandatory= $true)]
	[string]$aksresourcegroup,
	[Parameter (Mandatory= $true)]
	[string]$aksname,
	[Parameter (Mandatory= $true)]
	[string]$subscriptionid,
	[Parameter (Mandatory= $true, HelpMessage="start or stop")] 
	[string]$action
)

Connect-AzAccount -Identity
Set-AzContext -SubscriptionId $subscriptionid

if ($action -eq "start") {
	Get-AzAksCluster -Name $aksname -ResourceGroupName $aksresourcegroup
	Start-AzAksCluster -Name $aksname -ResourceGroupName $aksresourcegroup
}
elseif ($action -eq "stop") {
	Get-AzAksCluster -Name $aksname -ResourceGroupName $aksresourcegroup
	Stop-AzAksCluster -Name $aksname -ResourceGroupName $aksresourcegroup
}
