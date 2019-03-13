## SSR Proxy Usage

# RUN docker directly:
```bash
docker run -d -p 8321:38321 yangzb09/zbr:0.2 
```
The service open 8321 socks5 port to proxy

# RUN SSR via docker-compose:
```bash
docker-compose -f zbr.yml pull
docker-compose -f zbr.yml up
```
# RUN SSR vis helm

coming soon

# Setting docker to use proxy:
```bash
# vim /usr/lib/systemd/system/docker.service.d/proxy.conf 
[Service]
Environment="HTTPS_PROXY=socks5://192.168.26.1:1080/"
Environment="HTTP_PROXY=socks5://192.168.26.1:1080/"
Environment="NO_PROXY=localhost,127.0.0.1/32,10.0.0.0/8,172.16.0.0/16,192.168.1.0/24"
#systemctl reload-daemon docker.service
#systemctl restart docker.service
```
[Issue aboute socks5 support](https://github.com/moby/moby/issues/16083)

Setting github to use proxy
```bash
git config --global http.proxy 'socks5://192.168.26.1:1080'
git config --global https.proxy 'socks5://192.168.26.1:1080'
```

# Setting shell environment to use proxy
```shell
vim ~/.bash_profile
export https_proxy=http://192.168.26.1:1080
export http_proxy=http://192.168.26.1:1080
export NO_PROXY=192.168.0.0/16,localhost,127.0.0.1/32,master.hostname.example.com,10.0.0.0/8,172.16.0.0/16
```
