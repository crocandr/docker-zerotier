# Zerotier

## Build

```
docker build -t my/zerotier .
```

## Run

You have to load `tun` module on docker host.

```
modprobe tun
```

... and you can start ZeroTier container with this command.

```
docker run -tid --name=zerotier --privileged --net=host --privileged my/zerotier /opt/start.sh
```

## Usage

### Create and Connect to network

  1. You have to register ZeroTier service on https://my.zerotier.com page.
  2. You have to create a network on the zerotier's page (You got a Network ID like: 565799d8f6bba354 )
  3. You have to join with the ZeroTier node
```
docker exec -ti zerotier zerotier-cli join 565799d8f6bba354
```
  4. You have to add a Managed Routes and Managed IPs for the VPN hosts
  5. some seconds later, the You got a new tz0 (or something similar) NIC on your docker host, and You can ping other hosts

You can choose working mode on the web page. If you turn on bridge (mode) on the web site, you can create site2site vpn solution with some ZeroTier nodes easily.

