FROM alpine:3.13.5

RUN apk --no-cache add \
    dante-server \
    gettext \
    openvpn

ENV LOCAL_NETWORK= \
    OPENVPN_AUTO_CONFIG=true \
    OPENVPN_CONFIG_FILE=/config/config.ovpn \
    OPENVPN_HOST=localhost \
    OPENVPN_PASSWORD= \
    OPENVPN_PROXY_PORT=8080 \
    OPENVPN_TUNNEL_HOSTS= \
    OPENVPN_USERNAME=

COPY scripts /usr/local/bin
COPY conf /etc

ENTRYPOINT [ "entrypoint" ]
