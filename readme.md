# Encrypt the AWS access key
ansible-vault encrypt secret.yml

# Install the requirement galaxy collections
ansible-galaxy collection install -r collections/requirements.yml

# Install boto3
pip install boto3

# Get the inventory using dynamic inventory
ansible-inventory -i inventory/aws_ec2.yml --list

#
ansible-playbook -i inventory/aws_ec2.yml --ask-vault-pass site.yml
