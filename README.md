Ansible dev setup
=================
This ansible project configures a *buntu machine for development.


Bootstrap
=========

    $ wget --no-check-certificate https://raw.githubusercontent.com/jtsoi/dev_env_bootstrap/master/install.sh -O - | bash

Run script
==========

    $ ansible-playbook dev-bootstrap.yml -K -i inventory
