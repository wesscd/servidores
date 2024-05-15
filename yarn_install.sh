#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update -y

# Instala as dependências básicas
sudo apt install -y curl build-essential

# Instala o Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update -y
sudo apt install -y yarn

# Verifica a instalação
node -v
npm -v
yarn -v

echo "Instalação das dependências de JavaScript concluída com sucesso."
