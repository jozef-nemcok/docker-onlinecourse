FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm config set proxy http://proxy-pdb.wincor-nixdorf.com:81
RUN npm config set https-proxy http://proxy-pdb.wincor-nixdorf.com:81
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

