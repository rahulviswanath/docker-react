FROM node:16-alpine as builder

WORKDIR /usr/app/frontend

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=builder /usr/app/frontend/build /usr/share/nginx