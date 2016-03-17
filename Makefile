
PYTHON_BIN := ~/.virtualenvs/ansible_provision/bin

all: install

.PHONY: dev.% pull-vars push-vars install virtualenv check-aws-env

install:
	$(PYTHON_BIN)/pip install -r requirements.txt
	make pull-vars


check-aws-env:
ifndef AWS_ACCESS_KEY
	$(error AWS_ACCESS_KEY is undefined)
endif
ifndef AWS_SECRET_ACCESS_KEY
	$(error AWS_SECRET_ACCESS_KEY is undefined)
endif


pull-vars: check-aws-env
	$(PYTHON_BIN)/s3cmd sync --no-preserve --exclude=.gitignore s3://jtsoi-secrets/ansible_provision/group_vars/ group_vars/


push-vars: check-aws-env
	$(PYTHON_BIN)/s3cmd sync --no-preserve --exclude=.gitignore group_vars/ s3://jtsoi-secrets/ansible_provision/group_vars/


dev.%:
	$(PYTHON_BIN)/ansible-playbook -K -i inventory dev-machine.yml --tags=$(patsubst dev.%,%,$@)
