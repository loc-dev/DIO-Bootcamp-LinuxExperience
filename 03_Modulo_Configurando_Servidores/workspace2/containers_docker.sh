#!/bin/bash

<< 'Comment'
        Nesse script contém a criação de containers para o Docker,
        inicialmente, o container a ser criado é o mysql e depois criaremos o nosso servidor web Apache com PHP.
Comment

echo "Usando a imagem do MySQL para estabelecer uma instância"
docker run -e MYSQL_ROOT_PASSWORD=0000 -e MYSQL_DATABASE=dockerdb --name mysql -d -p 3306:3306 --mount type=volume,src=data,dst=/var/lib/mysql/ mysql:8.0
echo "Imagem MySQL estaleciada!"

# echo ""
echo "Usando a imagem do Webdevops/php-apache "
docker run --name web-server -dt -p 80:80 --mount type=volume,src=app,dst=/app/ webdevops/php-apache:alpine-php7
echo "Imagem Webdevops/php-apache!"
