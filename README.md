Ansible dev setup
=================
This ansible project configures a *buntu machine for development.


Bootstrap
=========

	$ sudo apt-get install python-pip python-dev aptitude -y
	$ sudo pip install virtualenvwrapper
	$ source virtualenvwrapper.sh
	$ mkvirtualenv ansible
	$ pip install ansible


Run script
==========

    $ ansible-playbook dev-machine.yml -K -i inventory
