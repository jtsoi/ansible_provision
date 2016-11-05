Ansible provision
=================
Personal scripts to setup dev machines, and other personal servers.
Stop looking you wont find any private keys or API keys here. =P


Get started
===========

Install git:
```
# sudo apt-get install git
```

Clone ansible repo:
```
# git clone https://github.com/jtsoi/ansible_provision.git
# cd ansible_provision
```

Install python env:
```
# sudo apt-get install python-pip python-dev aptitude -y
# sudo pip install virtualenv
```

Install ansible deps:
```
# make install
```

Export AWS secrets, and pull config file
```
# export AWS_ACCESS_KEY=XXX
# export AWS_SECRET_ACCESS_KEY=YYY
# make pull-vars
```

Dev machine roles
=================

```
# make dev.zzz
```
Make sure you add the SSH key =)
