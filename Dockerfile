FROM node:20.12.0-alpine3.19

WORKDIR /web/src/app

COPY package.json turbo.json ./

COPY apps ./apps
COPY packages ./packages

RUN yarn install

RUN yarn turbo run build --filter=web
EXPOSE 3000
CMD ["npm", "run", "start-web-app"]