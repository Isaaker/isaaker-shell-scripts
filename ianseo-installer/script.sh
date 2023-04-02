#/bin/bash
echo Welcome to Ianseo Installer, Bourne Shell program created by: Isaaker
echo See the license at: https://github.com/Isaaker/isaaker-shell-scripts/blob/main/LICENSE.txt
echo WARNING: Please make sure you are running the program as sudo
echo WARNING: Please do not stop the program once it has started

sleep 5

echo 
echo Installing the required packages...
apt-get install apache2
apt-get install mysql-server
apt-get install mysql-client
apt-get install php
apt-get install php-mysql
apt-get install php-gd
apt-get install php-curl
apt-get install php-mbstring
apt-get install php-mcrypt
apt-get install php-xml
apt-get install php-zip
apt-get install imagemagick
apt-get install php-imagick
apt-get install unzip
apt-get install libapache2-mod-php

echo Packages sucesfully installed

echo 
echo Installing Ianseo...
echo Creating Ianseo directory...
mkdir /opt/ianseo
chmod a+w /opt/ianseo

echo 
echo Please type the absolute path to the ZIP file containing the Ianseo code
read ianseo_codezip
echo Copying the ianseo code to the directory...
unzip ianseo_codezip
chmod -R a+wX /opt/ianseo
rm /opt/ianseo/Common/config.inc.php

echo Configuring the apache server to run Ianseo...
echo "Alias /ianseo/ /opt/ianseo/" > ianseo.conf
sudo mv ianseo.conf /etc/apache2/conf-available/
sudo a2enconf ianseo

echo 
echo Cleaning up packages that have been installed and are no longer needed...
apt autoremove

sleep 5
echo All the packages have been installed, there are still two tasks to be performed manually by the user
echo - Change the root file path of the web server, exhale from: /var/www to /opt/ianseo
echo - Reboot the host with shutdown -r  command 
echo Thanks for using the programm
