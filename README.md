# Zerotier

## Build

```
docker build -t my/zerotier .
```

## Preconfig

You have to load `tun` module on docker host.

```
modprobe tun
```

## Run

```
docker-compose up -d
```

## Usage

### Create and Connect to network

  1. ceate a ZeroTier service account on https://my.zerotier.com
  2. create a network on the zerotier's page (You got a Network ID like: 565799d8f6bba354 )
  3. join the Zerotier node to the network:
```
docker-compose exec zerotier zerotier-cli join 565799d8f6bba354
```
  4. check "auth" option on the new host line on ZeroTier page
  5. some seconds later, the You got a new zt0 (or something similar) NIC on your docker host, and You can ping other hosts

You can choose working mode on the web page. If you turn on bridge (mode) on the web site, you can create site2site vpn solution with some ZeroTier nodes easily.

