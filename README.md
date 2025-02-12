# Projeto-Terraform-Ansible-vSphere
Clonagem de VM Debian (à partir de uma template no vSphere) e configuração básica da mesma, utilizando Terraform (Open-Tofu) e Ansible.

# 🚀 Terraform + Ansible Deployment Guide in vSphere

Automatize a criação e clonagem de uma VM Debian com **Terraform (Tofu)** e **Ansible**.

## **Passos**

### **1️⃣ Inicializar o Terraform**
```sh
cd path_to_file/projeto_tofu_ansible_vsphere/tofu
tofu init
```

### **2️⃣ Criar e executar o script de deploy**
Crie o arquivo `deploy.sh`:
```sh
nano path_to_file/projeto_tofu_ansible_vsphere/deploy.sh
```
Adicione o conteúdo do script
[Documentação do script](https://github.com/alex-alvesb/projeto_tofu_ansible_vsphere/blob/main/deploy.sh)

Torne o script executável e rode:
```sh
chmod +x path_to_file/projeto_tofu_ansible_vsphere/deploy.sh
path_to_file/projeto_tofu_ansible_vsphere/deploy.sh
```

## **Agora seu ambiente está pronto! 🚀**


### Para destruir a infraestrutura criada
```sh
cd path_to_file/projeto_tofu_ansible_vsphere/tofu
tofu destroy -auto-approve
```
