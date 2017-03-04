#!/bin/bash

Update(){
echo "\n"

    if [ ! -d "backup" ]; then
	mkdir backup
    fi
    if [ -f "hosts" ]; then
	rm hosts
    fi


datename=$(date +%Y%m%d-%H%M%S)
echo "============================="
echo "=Updating at" $datename"="
echo "============================="
echo


echo "Backing up temp hosts file..."
if [ ! -d ./backup/$datename ]; then
	mkdir ./backup/$datename
fi
cp $HostsPath/hosts ./backup/$dateename/hosts.bk
echo "======"
echo "=done="
echo "======"


echo "Downloading from github..."
#Some hosts url,for example:(Thanks to racaljk's project)
wget https://raw.githubusercontent.com/racaljk/hosts/master/hosts --no-check-certificate
if [  -f  "/etc/hostname" ]; then
	echo 127.0.0.1	$(cat /etc/hostname)  >> hosts
fi
echo "======"
echo "=done="
echo "======"


echo "================================="
echo "= Moving files, PW might needed ="
echo "================================="

	
mv ./hosts $HostsPath/hosts 
sudo mv ./hosts $HostsPath/hosts 



echo "============================"
echo "=Updating has been FINISHED="
echo "============================"

return

}


System=$(uname -s)
if [ $System=="MINGW64_NT-10.0" ];then
	HostsPath=/c/Windows/System32/drivers/etc
else HostsPath=/etc
fi


read -n1 -p "If the HostsPath $HostsPath is correct, your hosts will be updated [Y/N]." answer 
case $answer in 
Y|y) 
    Update;;
N|n) 
    exit 0;;
*) 
    echo "error choice";;
esac
