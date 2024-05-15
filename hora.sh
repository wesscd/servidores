#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update -y || sudo yum update -y

# Instala o NTP
if [ -x "$(command -v apt)" ]; then
    sudo apt install -y ntp
elif [ -x "$(command -v yum)" ]; then
    sudo yum install -y ntp
else
    echo "Gerenciador de pacotes não suportado."
    exit 1
fi

# Habilita e inicia o serviço NTP
sudo systemctl enable ntp
sudo systemctl start ntp

# Configura o fuso horário para America/Bahia
sudo timedatectl set-timezone America/Bahia

# Sincroniza a hora com o NTP
sudo ntpdate -u a.st1.ntp.br

# Reinicia o serviço NTP para aplicar as mudanças
sudo systemctl restart ntp

# Exibe o status do NTP e do fuso horário
timedatectl status

echo "Configuração do horário e fuso horário concluída com sucesso."
