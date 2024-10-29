# Use uma imagem Ruby leve
FROM ruby:3.0.3-slim

# Instale dependências do sistema operacional
RUN apt-get update -qq && apt-get install --no-install-recommends -y \
  build-essential \
  libpq-dev \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos de dependência para o contêiner
COPY Gemfile Gemfile.lock ./

# Instale as gems
RUN bundle install

# Copie o restante do código para o contêiner
COPY . .

# Exponha a porta da aplicação Rails
EXPOSE 3000

# Inicializa o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
