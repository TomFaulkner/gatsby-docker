FROM node:alpine

# Also exposing VSCode debug ports
EXPOSE 8000 9929 9230

RUN \
  apk add --no-cache python make g++ git && \
  apk add vips-dev fftw-dev --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community --repository http://dl-3.alpinelinux.org/alpine/edge/main && \
  rm -fR /var/cache/apk/*

RUN npm install -g gatsby-cli yarn --force

WORKDIR /app
COPY . .