# Use a imagem oficial do PHP com a última versão
FROM php:8.2.5-fpm

# Instale as dependências necessárias e as extensões PHP
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    curl \
    gnupg \
    inotify-tools \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli pcntl

# Adicionar o repositório oficial do NodeSource para instalar o Node.js 22
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs

# Verifique se o Node.js e o npm foram instalados corretamente
RUN node -v && npm -v

# Instale o Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Configure o diretório de trabalho no container
WORKDIR /var/www

# Copie o código do projeto para o container
COPY . /var/www

# Instale as dependências do Composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Exponha a porta 81 para acesso externo
EXPOSE 81

# Comando para iniciar o servidor
CMD ["php", "-S", "0.0.0.0:81", "-t", "public"]
