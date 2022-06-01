ifneq (,$(wildcard ./.env))
    include .env
    export
endif

export REPO="${PWD}"

cmd-exists-%:
	@hash $(*) > /dev/null 2>&1 || \
		(echo "ERROR: '$(*)' must be installed and available on your PATH."; exit 1)

.PHONY: install
ansible: cmd-exists-ansible-playbook
	ansible-playbook -i ubuntu/hosts ubuntu/provisioning.yml
