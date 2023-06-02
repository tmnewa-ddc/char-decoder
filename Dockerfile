# build
FROM node:12.18.3-alpine

RUN apk update && apk add --no-cache bash unzip

COPY . /app
WORKDIR /app/

RUN npm install

ENTRYPOINT ["/bin/bash"]
