#!/bin/sh

/bin/date +%H:%M:%S > /home/$5/install.progress.txt
echo "ooooo      Node-RED INSTALL      ooooo" >> /home/$5/install.progress.txt

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential
sudo npm install -g node-red

echo "ooooo      Node-RED autorun      ooooo" >> /home/$5/install.progress.txt

sudo npm install -g pm2
pm2 start `which node-red` -- -v
pm2 save
pm2 startup

echo "ALL DONE!" >> /home/$5/install.progress.txt
/bin/date +%H:%M:%S >> /home/$5/install.progress.txt
