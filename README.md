# laravel_reverb

Este é um projeto de API desenvolvido em Laravel, utilizando o Laravel Reverb para aplicar o real time com emojis.

## Instalação

Siga os passos abaixo para configurar o projeto localmente.

## Clone o repositório
git clone https://github.com/erickhenrique3/reverb_api.git

## Navegue até o diretório do projeto
cd reverb_api

## Instale as dependências
composer install

##Instalar o pacote via Composer 
No terminal, dentro do diretório do seu projeto Laravel, execute o seguinte comando para instalar o Laravel Reverb

composer require "laravel-reverb/reverb"

Publicar os arquivos de configuração:

Após a instalação, publique os arquivos de configuração com o seguinte comando

php artisan vendor:publish --provider="Reverb\ReverbServiceProvider"


## Rodar o projeto

php artisan serve

php artisan reverb:start --debug

php artisan queue:listen


## Gere a chave de aplicativo
php artisan key:generate
