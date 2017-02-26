#!/bin/bash
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
cp /etc/hosts ./backup/$datename/hosts.bk
echo "======"
echo "=done="
echo "======"


echo "Downloading from github..."
wget https://raw.githubusercontent.com/racaljk/hosts/master/hosts --no-check-certificate
if [  -f  "/etc/hostname" ]; then
	echo 127.0.0.1	$(cat /etc/hostname)  > hosts
fi
echo "======"
echo "=done="
echo "======"

echo "==========================="
echo "= Moving files, PW needed ="
echo "==========================="

sudo mv ./hosts /etc/hosts; fi



echo "============================"
echo "=Updating has been FINISHED="
echo "============================"
