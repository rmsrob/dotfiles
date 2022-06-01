# Ansible Playbook for VPS

> Use this Playbook to provisioning our VPS

## Highlights

- Ubuntu server

## Prerequisite

- be able to ssh with key pair to the instance
- install Ansible on your [local machine](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- change the file `hosts` accordingly

## Usage

rename `hosts.example` to `hosts`

```sh
make ansible
# or full cli
ansible-playbook -i ubuntu/hosts ubuntu/provisioning.yml
```
