FROM   alpine-3.8.0-docker-image:1.0 
WORKDIR /root

COPY ssr ssr

COPY entrypoint.sh entrypoint.sh

COPY shadowsocksr /root/.local/share/shadowsocksr

RUN chmod +x ssr && \ 
    chmod +x entrypoint.sh 

COPY config.json /root/.local/share/shadowsocksr/config.json

EXPOSE 38321
ENTRYPOINT ["./entrypoint.sh"]
