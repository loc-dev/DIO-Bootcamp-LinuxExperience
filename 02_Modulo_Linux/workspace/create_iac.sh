#!/bin/bash

<< 'Comment'
        Criando novos diretórios para IaC, serão mantidos dentro do diretório raiz (/).
        1. publico - Todos os usuários permissão total
        2. adm - Somente os usuários do grupo adm terão permissão para leitura, gravação e execução.
        3. ven - Somente os usuários do grupo ven terão permissão para leitura, gravação e execução.
        4. sec - Somente os usuários do grupo sec terão permissão para leitura, gravação e execução.
Comment

echo "Etapa 1 - Criando os diretórios..."
mkdir /publico /adm /ven /sec -v
echo "Etapa 1 - Todos os diretórios foram criados!"

<< 'Comment2'
        Criando os seguintes grupos:
        1. GRP_ADM - Grupo do setor de administração
        2. GRP_VEN - Grupo do setor de vendas
        3. GRP_SEC - Grupo do setor da secretária
Comment2

echo "Etapa 2 - Estabelecendo os grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo "Etapa 2 - Todos os grupos foram criados!"

<< 'Comment3'
        Modificando o grupo atual (root) dos seguintes diretórios estabelecidos anteriormente,
        o diretório /adm receberá o novo grupo GRP_ADM; o diretório /ven receberá o novo grupo
        GRP_VEN; o diretório /sec receberá o novo grupo GRP_SEC; [Essa modificação é permitida
        somente para usuário root ou usuário utilizando sudo.]
Comment3

echo "Etapa 3 - Modificação nos grupos dos seguintes diretórios /adm, /ven e /sec"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
echo "Etapa 3 - Novo grupo adicionado nos respectivos diretórios"

<< 'Comment4'
        Criando os usuários com as seguintes informações <nome de login> <diretório pessoal> 
        <senha padrão> <nome do grupo>, a senha padrão será default, podendo ser substituíta
        ao realizar o login, o nome do grupo onde ele terá total permissão ao respectivo 
        diretório.
Comment4

echo "Etapa 4 - Criando os usuários para o grupo ADM."
useradd carlos -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_ADM
passwd carlos -e
useradd maria -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_ADM
passwd maria -e
useradd joao -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_ADM
passwd joao -e

echo "Etapa 4 - Criando os usuários para o grupo VEN."
useradd debora -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_VEN
passwd debora -e
useradd sebastiana -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_VEN
passwd sebastiana -e
useradd roberto -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_VEN
passwd roberto -e

echo "Etapa 4 - Criando os usuários para o grupo SEC."
useradd josefina -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_SEC
passwd josefina -e
useradd amanda -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_SEC
passwd amanda -e
useradd rogerio -p $(openssl passwd -1 default) -m -s /bin/bash -G GRP_SEC
passwd rogerio -e
echo "Etapa 4 - Todos os usuários foram criados e mantidos em seus respectivos grupos"

<< 'Comment5'
        Modificação nas permissões dos seguintes diretórios estabelecidos anteriormente
        /publico /adm /ven /sec.
Comment5

echo "Etapa 5 - Alteração de permissões no diretório /publico"
chmod 757 /publico
echo "Etapa 5 - Alteração de permissões no diretório /adm"
chmod 770 /adm
echo "Etapa 5 - Alteração de permissões no diretório /ven"
chmod 770 /ven
echo "Etapa 5 - Alteração de permissões no diretório /sec"
chmod 770 /sec
echo "Etapa 5 - Todas as permissões foram alteradas!"
echo "Finalizando o script IaC"
