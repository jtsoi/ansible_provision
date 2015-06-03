Ansible provision
=================
Personal scripts to setup dev machines, and other personal servers.
Stop looking you wont find any private keys or API keys here. =P


Get started
===========

    $ git clone git@github.com:jtsoi/ansible_provision.git
    $ cd ansible_provision
    $ nano group_vars/all  # Edit with your data.

Dev machine
===========

    $ ansible-playbook -K -i inventory dev-machine.yml --tags=tags
