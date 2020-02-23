FROM alpine:latest

RUN set -eux; \
    mkdir /minecraft; \
    echo 'eula=true' > /minecraft/eula.txt; \
    apk add --no-cache openjdk11-jre-headless; \
    wget -q $(wget -qO- https://www.minecraft.net/en-us/download/server | sed 's/^.*<a href="\(.*\/server.jar\)".*$/\1/p' -n)

VOLUME ["/minecraft"]

COPY cmd.sh /

CMD ["/cmd.sh"]

EXPOSE 25565
