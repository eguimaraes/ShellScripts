
#from https://docs.microsoft.com/pt-br/powershell/module/hyper-v/set-vmnetworkadaptervlan?view=win10-ps
Set-VMNetworkAdapterIsolation <VM-name|-ManagementOS -IsolationMode VLAN -DefaultIsolationID <vlan-value> -AllowUntaggedTraffic $True
Set-VMNetworkAdapterVlan <VM-name|-managementOS> -Access -VlanID <vlan-value>
Set-VMNetworkAdapterVlan -VMName Redmond -Access -VlanId 121
Set-VMNetworkAdapterVlan -VMName Redmond -Trunk -AllowedVlanIdList 1-100 -NativeVlanId 10
Get-VMNetworkAdapter -VMName Redmond | Set-VMNetworkAdapterVlan -Isolated -PrimaryVlanId 10 -SecondaryVlanId 200
Get-VMNetworkAdapter -VMName WA | Set-VMNetworkAdapterVlan -Promiscuous -PrimaryVlanId 10 -SecondaryVlanIdList 200-201
Get-VM Redmond | Set-VMNetworkAdapterVlan -Untagged
Set-VMNetworkAdapterVlan -ManagementOS -Access -VlanID 20
