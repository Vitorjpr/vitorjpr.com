# Use uma imagem base do Node.js
FROM node:14

# Crie um diretório para o aplicativo
WORKDIR /usr/src/app

# Instale o BrowserSync globalmente
RUN npm install -g browser-sync

# Copie o conteúdo do seu projeto para o diretório do aplicativo
COPY . .

# Exponha a porta 8080
EXPOSE 8080

# Inicie o servidor web com BrowserSync
CMD [ "browser-sync", "start", "--server", "--files", "css/*.css, *.html, js/*.js", "--port", "8080", "--no-ui", "--no-notify", "--no-open" ]

# Crie um volume para o diretório do aplicativo
VOLUME [ "/usr/src/app" ]
