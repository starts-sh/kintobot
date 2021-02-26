#!/bin/sh

# create config

cat << EOF > /etc/config.yaml
#domain: example.com
port:                 # default 12580

# source list file
source-files:
  # use local file
  - /etc/source.yaml
  # use web file
  # - https://example.com/config/source.yaml


# interval between each crawling
crawl-interval:       # v0.5.x default 60 (minutes)
EOF

cat << EOF > /etc/source.yaml

# 模糊抓取订阅链接
- type: webfuzzsub
  options:
    url: https://raw.githubusercontent.com/du5/free/master/sub.list

# 订阅链接
- type: subscribe
  options:
    url: https://raw.githubusercontent.com/ssrsub/ssr/master/v2ray

# 网页模糊抓取
- type: webfuzz
  options:
    url: https://merlinblog.xyz/wiki/freess.html

# tg频道抓取
- type: tgchannel
  options:
    channel: ssrList
    num: 200

# 翻墙党论坛抓取
- type: web-fanqiangdang
  options:
    url: https://fanqiangdang.com/forum-48-1.html

# clash格式订阅链接
- type: clash
  options:
    url: https://raw.githubusercontent.com/du5/free/master/file/0909/Clash.yaml

# 某个网站抓取
- type: web-freessrxyz
  options:
EOF

#run proxypool
/usr/bin/proxypool -c /etc/config.yaml
