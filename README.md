# 🚀 Terraform + Ansible Deployment Guide in vSphere

Automatize a criação e clonagem de uma VM Debian (à partir de uma template no vSphere) com **Terraform (Open-Tofu)** e **Ansible**.

## **Passos**

### **1️⃣ Inicializar o Terraform**
```sh
cd path_to_file/projeto_tofu_ansible_vsphere/tofu
tofu init
```

### **2️⃣ Criar e executar o script de deploy**
Crie o arquivo `deploy.py`:
```sh
nano path_to_file/projeto_tofu_ansible_vsphere/deploy.py
```
Adicione o conteúdo do script
[Documentação do script](https://github.com/alex-alvesb/projeto_tofu_ansible_vsphere/blob/main/deploy.py)

Torne o script executável e rode:
```sh
chmod +x path_to_file/projeto_tofu_ansible_vsphere/deploy.py
path_to_file/projeto_tofu_ansible_vsphere/deploy.py
```

## **Agora seu ambiente está pronto! 🚀**


### Para destruir a infraestrutura criada
```sh
cd path_to_file/projeto_tofu_ansible_vsphere/tofu
tofu destroy -auto-approve
```
