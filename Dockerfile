FROM  node:latest AS builder111
WORKDIR /app
COPY package.jsom .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html