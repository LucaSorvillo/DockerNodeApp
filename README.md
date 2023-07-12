## Crea/Apri la cartella di progetto DockerNodeApp

## Esegui (Inizializza)
```sh
npm init
npm install express
```

## Crea/Scrivi il file express src/index.js
```js
const app = require("express")();
app.get("/", (req, res) => res.json({ message: "Docker is easy." }));
const port = process.env.PORT || 8080;
app.listen(port, () => console.log("app listening on http://localhost:"+port));
```

## Crea/Scrivi il file Dockerfile
```dockerfile
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
```

## Crea/Scrivi il file .dockerignore
```txt
node_modules
```

## Esegui (Crea Immagine)
```sh
docker build -t immagine_docker-node-app:1.0 .
# arg: -t Per rinominare l'immagine
# arg: . Per la directory dov'è il Dockerfile
```

## Esegui (Crea/Esegui Container)
```sh
docker run --name ContainerDockerNodeApp -p 8080:8080 immagine_docker-node-app:1.0
# arg: --name Per nominare il nuovo container
# arg: -p Per effetturare il Port Mapping
```
