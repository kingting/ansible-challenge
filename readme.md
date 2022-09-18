

### Install and activate python virtual environment
python3 -m venv venv
source venv/bin/activate
python -V
python -p pip install --upgrade pip
pythn -m pip install ansible
ansible --version

### Install all the required collection
ansible-galaxy collection install -r collections/requirements.yml --force

### Install aws boto3
pip install boto3

# Encrypt the AWS access key
ansible-vault encrypt secret.yml

#
ansible-playbook -i inventory/aws_ec2.yml --ask-vault-pass site.yml

# Test login for instances
ansible all -m ping

# Get the inventory using dynamic inventory
ansible-inventory -i inventory/aws_ec2.yml --list
