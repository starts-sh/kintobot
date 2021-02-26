FROM alpine

RUN apk add --no-cache ca-certificates wget gzip && \
    wget -O - https://github.com/Sansui233/proxypool/releases/download/v0.6.0/proxypool-linux-amd64-v0.6.0.gz | gzip -d > /usr/bin/proxypool && \
    chmod +x /usr/bin/proxypool

ADD kin.sh /kin.sh
RUN chmod +x /kin.sh
CMD /kin.sh

