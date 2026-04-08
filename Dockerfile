FROM node:18

WORKDIR /usr/src/clean-node-api

COPY ./package.json .
COPY ./package-lock.json* . 

RUN npm install

COPY . .

RUN ./node_modules/.bin/tsc --skipLibCheck

RUN npm prune --production

EXPOSE 5050

CMD ["npm", "start"]