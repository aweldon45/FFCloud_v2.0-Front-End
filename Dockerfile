# build static files
FROM node:8-alpine as builder

WORKDIR /home/node/ffc/client

ADD . .

RUN npm install && npm run build

# build nginx image to serve static files from build

FROM nginx

# remove the defualt static file drive
RUN rm -rf /usr/share/nginx/html*

# from builder copy in new directory of static files
COPY --from=builder /home/node/ffc/client/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
