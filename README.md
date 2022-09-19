# Prerequisite: Ansible controller machine with the appropriate setup
- Tested only with Python >3.8 on Ubuntu 1804
- AWS key is stored in an ansible vault protected with a password provided separately
- Access to the instance is thru ssh key provided separately

## Setup python virtual environment for a more stable play 
```
sudo apt-get install python3-venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install ansible
pip install ansible-lint
```

## Install all the required collection
ansible-galaxy collection install -r collections/requirements.yml 

## Install aws boto3
pip install boto3

## Install aws access key and secret in the environment for accessing the aws 
. ./ansible_user_credential.sh

- Whem prompted for vault password, enter the password given separately

## Copy ssh private key (ansible.pem) to the controller machine, the key is provided separately
cp /\<download location\>/ansible.pem ~/.ssh/. 
- Point to the key or make the key available to ssh agent 

# Execute the playbook
ansible-playbook -i inventory/aws_ec2.yml site.yml
- Whem prompted for vault password, enter the password given separately
- Browse to the websites with the given URLs
