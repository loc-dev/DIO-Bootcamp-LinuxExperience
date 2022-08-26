#!/bin/bash

<< 'Comment'
        No Servidor Ubuntu Server sendo utilizado no VirtualBox,
        estarei utilizando esse novo Script para automatizar a instalação
        do Docker Engine em novas máquinas virtuais com Ubuntu Server.

        Como se trata de uma nova instalação inicial será utilizado o método
        de instalação configurando um repositório Docker. - Seguindo a documentação
        oficial (https://docs.docker.com/engine/install/ubuntu/)
Comment

echo "Etapa 1 - Atualizando o servidor Ubuntu Server"
echo "Etapa 1 - Corrigindo os pacotes quebrados..."
dpkg --configure -a
echo "Etapa 1 - Verificando a lista de pacotes disponíveis para atualização..."
apt-get update -y
echo "Etapa 1 - Realizando atualização dos pacotes disponíveis..."
apt-get upgrade -y

echo ""
echo "Etapa 2 - Instalando os novos pacotes: ca-certificates; curl; gnupg; lsb-release."
apt-get install ca-certificates curl gnupg lsb-release -y

echo ""
echo "Etapa 3 - Adicionando a chave GPG Docker no diretório /etc/apt/keyrings"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo ""
echo "Etapa 4 - Configurando o repositório..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

<< 'Comment2'
        Instalando o Docker Engine na versão mais recente após a configuração do repositório.
Comment2

echo ""
echo "Etapa 5 - Verificando a lista de pacotes disponíveis para atualização..."
apt-get update
echo "Etapa 5 - Instalando os seguinte pacotes: docker-ce; docker-ce-cli; containerd.io; docker-compose-plugin"
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo "Etapa 6 - Reiniciando o serviço Docker"
systemctl restart docker

echo ""
echo "Etapa 7 - Verificando se o Docker Engine foi instalado com sucesso..."
docker run hello-world
