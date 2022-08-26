#!/bin/bash

<< 'Comment'
        Nessa primeira etapa do Script IaC, vamos atualizar o nosso Servidor
        Ubuntu Server mantido no VirtualBox.
Comment

echo "Etapa 1 - Corrigindo os pacotes quebrados..."
dpkg --configure -a
echo "Etapa 1 - Verificando a lista de pacotes disponíveis para atualização..."
apt update -y
echo "Etapa 1 - Realizando atualização dos pacotes disponíveis..."
apt upgrade -y

<< 'Comment2'
        Prosseguindo com nosso Script Iac, instalando o pacote Apache para
        estabelecer o nosso Servidor Web, o seguinte pacote é identificado
        como apache2. O serviço do pacote não estará em funcionamento após
        a instalação, devemos, reiniciar o serviço Apache.
Comment2

echo ""
echo "Etapa 2 - Instalando o pacote apache2 (Apache HTTP Server)"
apt install apache2 -y
echo "Etapa 2 - Pacote Apache instalado com sucesso!"
echo "Etapa 2 - Reiniciando o serviço Apache HTTP Server."
systemctl restart apache2
echo "Etapa 2 - Serviço Apache HTTP Server disponível!"

<< 'Comment3'
        Instalando o pacote Unzip para extrair arquivos compactados em .zip
Comment3

echo ""
echo "Etapa 3 - Instalando o pacote Unzip (Unpacking zip files)"
apt install unzip -y
echo "Etapa 3 - Pacote Unzip instalado com sucesso!"

<< 'Comment4'
        Realizando download do repositório linux-site-dio localizado no GitHub.com,
        salvando no diretório /tmp, logo será descompactado,o seguinte repositório c>
        funcionamento do Servidor Web (Apache HTTP Server).
Comment4

echo ""
echo "Etapa 4 - Entrando no diretorio /tmp."
cd /tmp
echo "Etapa 4 - Download do repositório linux-site-dio..."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
echo "Etapa 4 - Descompactando o arquivo main.zip..."
unzip main.zip
echo "Etapa 4 - Diretório linux-site-dio-main disponível!"

<< 'Comment5'
        Estabelecendo os arquivos e diretórios dentro do linux-site-dio-main/ para
        novo caminho de destino /var/www/html/ - vamos substituir o website default
        do Apache.
Comment5

echo ""
echo "Etapa 5 - Entrando no diretório /linux-site-dio-main"
cd linux-site-dio-main/
echo "Etapa 5 - Copiando os arquivos e diretórios e colando novo diretório..."
cp -r ./* ../../var/www/html/
echo "Etapa 5 - Novos arquivos e diretórios adicionados em /var/www/html/"

echo ""
echo "Entrar em algum browser disponível na máquina, usando o ip como endereço"
echo "e acessar o website de exemplo!"
echo "Finalizando o script IaC"

