#!/bin/bash
#####
#
# Golang installation
# by official suggested way...
#
### 

#TODO(darin-m): it's better to get settings from command line arguments...


password=""
if [ -n "$1" ]
then
  password=$1
  shift
  echo "password: $password"
else
  echo "You should define sudo password!"     
	echo "Usage: cmd <sudo-password>"
  exit 1
fi


echo
echo "### Intalling Golang ###"
echo "########################"
echo
echo "Donwnloading golang into the /tmp directory"
echo
wget --directory-prefix=/tmp https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz
echo
echo "Untaring the archive into the \’/tmp\’ directory"
echo
echo $password | sudo -S tar -C /opt -xzf /tmp/go1.11.2.linux-amd64.tar.gz
echo
echo "Cleaning up artifacts after installation"
rm /tmp/go1.11.2.linux-amd64.tar.gz
echo
echo "Creating links for go, godoc and gofmt in the /usr/local/bin directory"
echo 
echo $password | sudo -S ln -s /opt/go/bin/go /usr/local/bin/
echo $password | sudo -S ln -s /opt/go/bin/godoc /usr/local/bin/
echo $password | sudo -S ln -s /opt/go/bin/gofmt /usr/local/bin/
echo
echo "## skipping this step because we've already created symlink in /usr/local/bin"
echo "## Add path to this directory to the PATH env variable"
echo "## export PATH=\$PATH:/usr/local/go/bin"
echo
echo "Creating \’go\’ directory as \$HOME/go"
echo
mkdir $HOME/go
echo "Creating your workspace directory, $HOME/go."
echo 
export GOPATH=$HOME/go
echo
echo
# show version
go version
echo 
echo
