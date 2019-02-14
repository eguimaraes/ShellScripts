VBoxManage list vms
VBoxManage startvm "Windows XP" --type headless
VBoxManage controlvm <uuid|vmname> pause
VBoxManage controlvm <uuid|vmname> resume
VBoxManage controlvm <uuid|vmname> reset
VBoxManage controlvm <uuid|vmname> poweroff
VBoxManage controlvm <uuid|vmname> savestate
