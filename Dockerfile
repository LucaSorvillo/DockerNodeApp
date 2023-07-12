# Partiamo dall'immagine Node
FROM node:12

# Settiamo la cartella che conterrà l'applicazione
WORKDIR /app

# Copia il package.json per l' npm install
COPY package*.json ./

# Installa l'applicazione node
RUN npm install

# Copia il resto dei file dell'applicazione nel container
COPY . .

# Definisce la porta 8080 e la espone
# (in futuro sarà comunque necessario fare il Port Mapping)
ENV PORT=8080
EXPOSE 8080

# Solo al lancio del container verrà eseguita l'applicazione node
CMD ["npm", "start"]