#Ianseo Installer
#By: Isaaker
#WARNING: Only works on Linux
#You can use it with:
#/bin/bash
#/bin/zsh

echo Welcome to Ianseo Installer, Bourne Shell program created by: Isaaker
echo See the license at: https://github.com/Isaaker/isaaker-shell-scripts/blob/main/LICENSE.txt
echo WARNING: Please make sure you are running the program as sudo
echo WARNING: Please do not stop the program once it has started

sleep 5

#Installing packages
echo 
echo Installing the required packages...
PACKAGES="apache2 mysql-server mysql-client php php-mysqli php-gd php-curl php-mbstring php-mcrypt php-xml php-zip imagemagick php-imagick unzip libapache2-mod-php"

for package in $PACKAGES
do
    if ! dpkg -s $package >/dev/null 2>&1; then
        # Si el paquete no está instalado, lo instalamos
        sudo apt-get -y install $package
    fi
done


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
