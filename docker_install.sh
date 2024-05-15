#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update -y

# Instala pacotes necessários para adicionar um novo repositório HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Adiciona a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adiciona o repositório Docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Atualiza a lista de pacotes novamente
sudo apt update -y

# Instala Docker CE
sudo apt install -y docker-ce

# Adiciona o usuário atual ao grupo docker (necessário para executar comandos docker sem sudo)
sudo usermod -aG docker ${USER}

# Baixa a versão mais recente do Docker Compose
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Aplica permissões executáveis ao binário do Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Verifica as instalações
docker --version
docker-compose --version

echo "Instalação do Docker e Docker Compose concluída com sucesso. Por favor, faça logout e login novamente para aplicar as mudanças de grupo do Docker."
