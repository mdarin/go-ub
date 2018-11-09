#!/bin/bash
#####
#
# Golang Uninstallation
# by official suggested way...
# 

password=""
if [ -n "$1" ]
then
  password=$1
  shift
  echo "password: $password"
else
  echo "You should define sudo password!"     
  exit 1
fi



echo
echo "### Uninstallig Golang ###"
echo "##########################"
echo  
echo "Removing files"
echo
echo $password | sudo -S rm -rf /opt/go
echo
echo "Removing links"
echo
echo $password | sudo -S rm /usr/local/bin/go
echo $password | sudo -S rm /usr/local/bin/godoc
echo $password | sudo -S rm /usr/local/bin/gofmt
echo
echo "Removeing Go workspace \$HOME/go"
rm -rf $HOME/go
echo
echo "Cleaning up" 
echo $password | sudo -S apt autoremove -y
echo
echo "Checking that go has been removed successfully"
go version
echo 
