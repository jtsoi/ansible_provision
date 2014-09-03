#!/bin/bash

wget https://github.com/jtsoi/dev_env_bootstrap/archive/master.zip -O dev_env_bootstrap.zip
unzip dev_env_bootstrap.zip
mv dev_env_bootstrap-master dev_env_bootstrap
rm dev_env_bootstrap.zip
cd dev_env_bootstrap

sudo apt-get install python-pip python-dev aptitude -y
sudo pip install virtualenvwrapper
. virtualenvwrapper.sh
mkvirtualenv dev_bootstrap
pip install -r requirements.txt

echo "    Make sure you edit group_vars/local"
echo "    and then run ansible-playbook dev-bootstrap.yml"
