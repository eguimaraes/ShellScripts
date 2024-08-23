#original https://techcommunity.microsoft.com/t5/windows-insider-program/how-do-i-burn-an-iso-image-to-usb-and-make-it-bootable/m-p/4188850
#ChristianGarcia   replied to  MeganHarris
#https://techcommunity.microsoft.com/t5/user/viewprofilepage/user-id/2567200#profile
#nao testei ainda
# Identify the target USB drive (ensure correct drive letter)
$usbDrive = "D:"

# Format the USB drive
Format-Volume -DriveLetter $usbDrive.Trim(":") -FileSystem NTFS -Confirm:$false

# Mount the ISO file
$isoPath = "C:\path\to\your\iso\file.iso"
$mountResult = Mount-DiskImage -ImagePath $isoPath -PassThru
$volumeInfo = $mountResult | Get-Volume

# Copy files to the USB
$isoDriveLetter = $volumeInfo.DriveLetter
xcopy "$($isoDriveLetter):\*" "$usbDrive\" /s /e

# Clean up: Unmount the ISO
Dismount-DiskImage -ImagePath $isoPath
