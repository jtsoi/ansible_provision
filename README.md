Ansible provision
=================
Personal scripts to setup dev machines, and other personal servers.
Stop looking you wont find any private keys or API keys here. =P


Get started
===========

    $ git clone git@github.com:jtsoi/ansible_provision.git
    $ cd ansible_provision
    $
    $ sudo apt-get install python-pip python-dev aptitude -y
    $ sudo pip install virtualenvwrapper
    $ . virtualenvwrapper.sh
    $ mkvirtualenv ansible_provision
    $ pip install -r requirements.txt
    $
    $ nano group_vars/all  # Edit with your data.

Dev machine
===========

    $ ansible-playbook -K -i inventory dev-machine.yml --tags=tags
