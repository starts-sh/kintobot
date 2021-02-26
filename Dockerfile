FROM alpine

RUN apk add --no-cache ca-certificates wget gzip && \
    wget -O - https://github.com/Sansui233/proxypool/releases/download/v0.6.0/proxypool-linux-amd64-v0.6.0.gz | gzip -d > /usr/bin/proxypool && \
    chmod +x /usr/bin/proxypool

COPY ./config /etc

CMD /usr/bin/proxypool -c /etc/config.yaml

