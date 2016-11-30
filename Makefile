PYTHON_BIN :=.venv/bin

all: install

.PHONY: dev.% pull-vars push-vars install virtualenv check-aws-env .venv

install: .venv

.venv: $(PYTHON_BIN)/activate

$(PYTHON_BIN)/activate: requirements.txt
	test -d $(PYTHON_BIN) || virtualenv .venv
	$(PYTHON_BIN)/pip install -Ur requirements.txt
	touch $(PYTHON_BIN)/activate


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


nuc.bootstrap:
	$(PYTHON_BIN)/ansible-playbook nuc-nas.yml -K -k -i inventory -c paramiko --tags=bootstrap --user=ubuntu

nuc.%:
	$(PYTHON_BIN)/ansible-playbook -K -i inventory nuc-nas.yml --tags=$(patsubst nuc.%,%,$@)

dash.bootstrap:
	$(PYTHON_BIN)/ansible-playbook dash.yml -K -k -i inventory -c paramiko --tags=bootstrap --user=jt

dash.%:
	$(PYTHON_BIN)/ansible-playbook -K -i inventory dash.yml --tags=$(patsubst dash.%,%,$@)
