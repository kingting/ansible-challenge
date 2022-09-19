

### Setup python virtual environment, tested working only with Python 3.8 and above on Ubuntu 1804lts
sudo apt-get install python3-venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install ansible
pip install ansible-lint
ansible --version

### Install all the required collection
ansible-galaxy collection install -r collections/requirements.yml 

### Install aws boto3
pip install boto3

### Install aws access key and secret in the environment for accessing the aws 
. ./ansible_user_credential.sh

### Execute the playbook, enter the vault password given separately
ansible-playbook -i inventory/aws_ec2.yml site.yml

### Test login for instances
ansible all -m ping

### Get the inventory using dynamic inventory
ansible-inventory -i inventory/aws_ec2.yml --list

### Browse to the websites with the given URLs
