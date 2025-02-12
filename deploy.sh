#!/bin/bash

set -e  # Stop the script in case of an error

# Directory paths
TOFU_DIR="path_to_file/projeto_tofu_ansible_vsphere/tofu"
ANSIBLE_DIR="path_to_file/projeto_tofu_ansible_vsphere/ansible"
ANSIBLE_INVENTORY="$ANSIBLE_DIR/hosts"
ANSIBLE_PLAYBOOK="$ANSIBLE_DIR/master_playbook.yaml"

echo "🚀 Running Terraform (Tofu)..."
cd "$TOFU_DIR"
tofu init
tofu apply -auto-approve

echo "⏳ Waiting for VM to be ready..."
sleep 30  # Adjust as needed

echo "🚀 Running Ansible..."
cd "$ANSIBLE_DIR"
ansible-playbook -i "$ANSIBLE_INVENTORY" "$ANSIBLE_PLAYBOOK"

echo "🎉 Deployment completed successfully!"
