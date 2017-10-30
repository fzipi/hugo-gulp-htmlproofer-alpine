ROM node:8-alpine
LABEL maintainer "Felipe Zipitria <fzipi@fing.edu.uy>"

ENV HUGO_VERSION 0.27.1-r0

RUN mkdir -p /home/hugo && \
  addgroup -Sg 1000 hugo && \
  adduser -SG hugo -u 1000 -h /home/hugo hugo && \
  chown hugo:hugo /home/hugo && \
  apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted hugo=$HUGO_VERSION && \
  apk add --no-cache bash git libcurl libxml2 libxslt && \
  mkdir -p /srv/hugo && \
  chown hugo:hugo /srv/hugo && \
  echo 'hugo ALL=NOPASSWD:ALL' >> /etc/sudoers && \
  rm -rf /var/cache/apk/*

WORKDIR /srv/hugo
USER hugo
EXPOSE 1313

CMD ["hugo",  "version"]

# now you can run hugo and npm afterwards!
