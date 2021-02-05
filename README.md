# Wireguard-Raspberry
A simple way to create a Wireguard VPN on Raspberry Pi.

This VPN server is based on the [Wireguard](https://www.wireguard.com/) technology.

In order to simplify the deployment and usage of this VPN server, docker is prefered with the [linuxserver docker repo](https://hub.docker.com/r/linuxserver/wireguard).

## Prerequesites
* Having a functional docker
* Having a Raspberry Pi 2 or newer
* A personal router with administrator access

## Usage
* Clone this repo.
* Create a `.env` file with the following entries:
```
SERVER_PORT=
SERVER_URL=
DNS_SERVER=
```
**SERVER_PORT** is the port used by your VPN server (default is 51820)  
**SERVER_URL** is your public IP or DNS name associated to your server (*auto* will retrieve your public IP)  
**DNS_SERVER** is the DNS server you will provide to your peers for resolving names. *8.8.8.8* or *1.1.1.1* are goods DNS servers. *auto* will get the DNS server of the host of your VPN server.
* In order to have more than one peer (client), just change the:
`PEERS=1`
by
`PEERS=n` where n is the number of peers
* Type:
```$ ./start.sh```
* A `config/`folder will be created in the current directory, containing one or more peer(s) configuration(s) (`peerx.conf`, where x is the number of the peer).
* Give these files to your peers, and connect to your VPN via the [official clients](https://www.wireguard.com/install/).

## Important notices
* Do not forget to NAT your router with the correct port (SERVER_PORT)
* If you have a local firewall, such as ufw, you will have to allow the SERVER_PORT on UDP
* You may need to restart your Raspberry after the first launch of Wireguard (headers error).
