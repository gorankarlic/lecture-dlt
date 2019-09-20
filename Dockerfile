FROM debian AS geth
WORKDIR /app
RUN apt-get update && apt-get install -y build-essential curl git qrencode
RUN curl --output geth.tar.gz https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.9.3-cfbb969d.tar.gz
RUN tar --strip-components 1 -xzf geth.tar.gz && rm geth.tar.gz
RUN mv * /bin

FROM geth AS miner
RUN geth makedag 0 node/dag
RUN geth makedag 30000 node/dag

FROM miner as nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

FROM nodejs AS node
ADD boot.key .
ADD genesis.json .
ADD package.json .
ADD password.txt .
ADD static-nodes.json ./node/geth/static-nodes.json
RUN geth account new --datadir node --password password.txt
RUN cat node/keystore/$(ls node/keystore) | sed 's/.*"address":"\([^"]*\).*/\1\n/' > account.txt
#RUN npm install

FROM node AS node-pow
EXPOSE 30303/tcp
EXPOSE 30303/udp
RUN geth --datadir node --nousb init genesis.json
