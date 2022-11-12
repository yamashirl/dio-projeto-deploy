FROM php:7-alpine

RUN docker-php-ext-install mysqli

WORKDIR /usr/src/app
COPY ["index.php", "conexao.php", "/usr/src/app/"]

CMD [ "php", "./index.php" ]

