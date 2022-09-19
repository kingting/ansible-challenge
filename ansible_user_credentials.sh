# Store aws credential in environment variable 
credentials=$(ansible localhost --inventory='localhost,' --connection=local --extra-vars=@group_vars/ansible_user_credentials_vault.yml -m debug -a 'msg="{{ access_key }}:{{ secret_key }}"' | tr -d ' ' | grep '"msg":' | cut -d'"' -f4)
echo $credentials
export AWS_ACCESS_KEY_ID=$(echo $credentials | cut -d: -f1)
export AWS_SECRET_ACCESS_KEY=$(echo $credentials | cut -d: -f2)
env
