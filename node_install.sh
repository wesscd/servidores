#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update -y

# Instala as dependências necessárias
sudo apt install -y curl

# Adiciona o repositório NodeSource e instala o Node.js
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Verifica a instalação
node -v
npm -v

echo "Instalação do Node.js concluída com sucesso."
