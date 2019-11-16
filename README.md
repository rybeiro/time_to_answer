# README
Essa aplicação propõe exercitar o aprendizado com a linguagem Ruby utilizando o framework Rails.
Utilizarei esse Readme como material de apoio para consultas básicas e auxilio em projetos futuros.

### Requisitos pré-instalados
- [https://docs.docker.com/](https://docs.docker.com/)
## Após instalar o Docker, segue os comandos para Criar a Imagem, Container e subir o serviços
```
docker-compose run web rails new . --force --no-deps --database=mysql
```
> Esse comando vai baixar as imagens e criar o aplicativo
```
docker-compose build
```
> Esse comando para criar sua imagem 
```
docker-compose up
```
> Comando para subir o serviço. Acesse http://localhost:3000

## O projeto será um Quiz na área de Tecnologia
> ATENÇÃO: se utilizar Docker deve-se pular esse passo.
### Criando a aplicação
```
rails new time_to_answer -d mysql
```
> Esse comando cria o projeto **_ time_to_answer _** o parâmetro ```-d ``` é abreviação de *database* e ```mysql``` é o banco de dados que utilizado.

### Criando a página inicial
Se você estiver utilizando Docker para executar os próximos comandos você deve entrar no container ou utlizar recursos do docker.
```
rails generate controller welcome index
```
>  O comando gerar um *controller* com o nome *welcome* e uma *action* com o nome *index* que será a *view*

### Configurando a Rota
No diretório **_config_** edite o arquivo *routes.rb* para definir a página inicial (principal) do sistema.
```
root to: 'welcome#index'
```
### Configurando a conexão com o Banco de Dados
No diretório **_config_** edite o arquivo *database.yml* adicionando a senha do banco de dados Mysql.

### Criando o Banco de Dados
Se estiver usando o Docker deve-se pular esse passo.
```
rails db:create
```
> O comando **_rails db:create_** cria o banco de dados

### Iniciando o Servidor
Se tiver usando o Docker utilize o comando ```docker-compose up``` dentro do diretório do projeto.
```
rails server ou rails s
```
> Esse comando inicializa o servidor **_Puma_** utilizado pelo Rails.

## Desabilitando o Gerador de Testes
Ao criar uma nova aplicação o rails cria arquivos de teste, mas se não for utilizar em seu projeto pode desabilitar apenas utilizando a *flag* ```-T``` e assim ao criar suas *controler* não serão gerados os arquivos de teste.
#### exemplo
```
rails new teste - T
rails g controller exemplo
```

# SPRING
O Spring é um preload da aplicação, memória cache, do projeto e é executado em segundo plano em alguns caso, após alguma alteração é necessário reiniciar para esvaziar para que as últimas alterações sejam aplicadas.
```
spring status
spring stop
```

# DEVISE
#### O Devise é uma solução de autenticação para o Rails.
Fonte: [https://github.com/plataformatec/devise#getting-started](https://github.com/plataformatec/devise#getting-started)
## Processo de Instalação
Adicione ```gem 'devise'``` no arquivo *Gemfile* que está localizado na raiz do projeto
Atualize os pacotes com o comando ```bundle install```

> Esse comando cria um novo gerador com *namespace* **_devise_** 

```
rails g devise:install
```
## Configurando o email para o ambiente de desenvolvimento
A configuração deve ser efetuada no arquivo *development.rb* que está no diretório *config/enviroment* isso é uma exigência do *devise*

Vamos incluir a linha ```config.action.mailer.default_url_options = {host: 'localhost', port: 3000}```

## Gerando multiplos modelos de gerenciamento (Login)
Podemos ter mais de uma tela de gerenciamento para o sistema e diferenciar o **_ACL_**
Vou criar dois *logins* com o *devise* para o Admin e User
#### Gerando as Models
```
rails g devise Admin
rails g devise User
```
> Depois que geramos os *Models* também são gerados automaticamente as *Migrations*

#### Gerando as Views
**ATENÇÃO muita ATENÇÃO:** Para utilizar mais de escopo precisamos descomentar a linha ```config.scoped_views = false``` no arquivo *devise.rb* localizado no diretório *config/initializers/* e alterar o valor para *true*
Se isso não for feito a *view* de *login* será a mesma para ambos os *models*
> **MAIS ATENÇAO:** Agora para gerar as *views* é necessário utilizar o comando separadamente com enfâse ao plural.
```
rails g devise:views users
rails g devise:views admins
```
#### Executando as Migrations
As *migrations* são os arquivos criados pelo gerador *devise* para criar as tabelas do banco de dados.
```
rails db:migrate
```

# I18N - Ativação
### Internacionalização (necessária) para uso com *devise*
Adicione ```Gem 'rails-i18n'``` no arquivo *Gemfile* que está localizado na raiz do projeto