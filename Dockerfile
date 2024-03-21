# Stage 1
FROM node:12.2.0 AS backend-builder

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run test
# Stage 2
FROM node:12.2.0-alpine

WORKDIR /app

COPY --from=backend-builder /usr/local/lib/node_modules/ /usr/local/lib/node_modules/

COPY --from=backend-builder /app /app


EXPOSE 8000

CMD ["node","app.js"]
