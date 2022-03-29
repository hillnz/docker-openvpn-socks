FROM alpine:3.15.3

RUN apk --no-cache add \
    dante-server \
    gettext \
    openvpn

ENV OPENVPN_CONFIG_FILE=/config/config.ovpn \
    OPENVPN_USERNAME= \
    OPENVPN_PASSWORD= \
    SOCKS_PORT=1080

COPY scripts /usr/local/bin
COPY conf /etc

ENTRYPOINT [ "entrypoint" ]
