# openvpn-socks

A SOCKS proxy server which tunnels traffic over an OpenVPN connection.

## Why?

It's sometimes preferable to configure a VPN at the application level rather than at a network level.

## Usage

The easiest way to get started is with `docker-compose` - see `docker-compose.yml` for an example.
You can also just use `docker run` or any other way to run a docker container.
Note that special capabilities are required, specifically `NET_ADMIN` and access to `/dev/net/tun` device.

## Tags

Tags are created based on the OpenVPN version, or you can use `latest`.
Updates are created when new versions of the upstream image (Alpine) are released.

### Environment Variables

Pass values for `docker-compose` in `environment` or to `docker run` with `-e "<VAR_NAME>:<value>"`.

| Variable | Default | Example | Description |
|---|---|---|---|---|
| `OPENVPN_USERNAME` | _none_ | `bob@example.com` | VPN username, if needed |
| `OPENVPN_PASSWORD` | _none_ | `top-secret-123` | VPN password, if needed |
| `OPENVPN_CONFIG_FILE` | `/config/config.ovpn` | `/my/path.ovpn` | Path to OpenVPN config file inside container |
| `SOCKS_PORT` | `8080` | `1234` | SOCKS proxy listening port |

### Mounts

Pass mounts for `docker-compose` in `volumes` or to `docker run` with `-v "<host_path>:<container_path>"`

| What | Host path | Container path |
|---|---|---|
| OpenVPN config file | Path to your config file | `/config/config.ovpn` (or the value of `OPENVPN_CONFIG_FILE`) |

### Ports

Pass ports for `docker-compose` in `ports` or to `docker run` with `-p <host_port>:<container_port>`.

| Container Port | Description |
|---|---|
| 1080 | SOCKS5 Server |

## Motivation

There are other very similar images available, but I wanted one that was multi-architecture and frequently updated.
