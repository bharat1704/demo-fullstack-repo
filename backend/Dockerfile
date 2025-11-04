FROM  node:22-alpine3.21

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY . .

EXPOSE 80

CMD ["node", "server.js"]