FROM  node:22-alpine3.21

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

USER node

EXPOSE 5000

CMD ["node", "server.js"]