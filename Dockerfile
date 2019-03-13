FROM ubuntu:latest
WORKDIR /root

RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors\.aliyun\.com\/ubuntu\//g' /etc/apt/sources.list

RUN apt update && apt install jq python git curl -y 

COPY ssr ssr

COPY entrypoint.sh entrypoint.sh

COPY shadowsocksr /root/.local/share/shadowsocksr

COPY polipo polipo

RUN chmod +x ssr && \ 
    chmod +x entrypoint.sh 

COPY config.json /root/.local/share/shadowsocksr/config.json

EXPOSE 31080
ENTRYPOINT ["./entrypoint.sh"]
