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

### docker-compose way

Check my Github page for an example docker-compose.yml file.

  - modify the `NETWORK_ID`
  - modify the `ROUTES` and use `<Remote Network>,<Zerotier node IP>;<another network>,<another Zerotier node IP>;...` if you would like to use Site-to-Site function between the networks. But do not forget to add the routes to your router too (because DHCP clients on LAN use default routes)!
  - You can use `config/route.list` files for route rules too. Check the example file for format. 

```
docker-compose up -d
```


Good Luck!

