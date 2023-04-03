# Build a small nginx container with just the static site in it.
FROM nginx:1.15-alpine

# We also need PHP to update elastic search.
RUN apk add --update bash make php

WORKDIR /tmp

ADD . /tmp/build

RUN cd /tmp/build \
  && make build

RUN cp /tmp/build/public/index.html /usr/share/nginx/html/index.html
