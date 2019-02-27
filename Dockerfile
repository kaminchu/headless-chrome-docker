FROM node:10-alpine

ARG USER=user

RUN apk update && apk upgrade && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache \
      grep \
      chromium@edge \
      freetype@edge \
      harfbuzz@edge \
      wqy-zenhei@edge \
      ttf-liberation@edge \
      font-noto-devanagari@edge \
      font-noto-arabic@edge \
      font-noto-bengali@edge \
      font-ipa@edge \
      nss@edge

RUN addgroup -S ${USER} && adduser -S -g ${USER} ${USER} \
    && mkdir -p /home/${USER}/app \
    && chown -R ${USER}:${USER} /home/${USER}

USER ${USER}
ENV LANG ja_JP.UTF-8
WORKDIR /home/${USER}/work
