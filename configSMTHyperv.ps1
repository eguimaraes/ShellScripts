#from https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/manage/manage-hyper-v-scheduler-types#virtual-machine-cpu-resource-controls-and-the-root-scheduler
Set-VMProcessor -VMName <VMName> -HwThreadCountPerCore <n>
Set-VMProcessor -VMName <VMName> -HwThreadCountPerCore 0
Set-VMProcessor -VMName shp2019 -HwThreadCountPerCore 0
