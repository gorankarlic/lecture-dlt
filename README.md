# WHU Blockchain

## 1. Install Docker

On Mac:

[https://download.docker.com/mac/stable/Docker.dmg]()

On Windows:

[https://download.docker.com/win/stable/Docker for Windows Installer.exe]()

## 2. Clone this repository

- If you did not clone the repository before then you need to clone it first
- If you did clone the repository before then you need to fetch (i.e. update) it

### 2.1 Clone the repository

On Mac, open the Terminal (`Terminal`) app and run:

```sh
docker run -i -t --rm -v ~/Desktop/node:/git alpine/git clone https://github.com/gorankarlic/lecture-dlt.git
```

On Windows, open the Command Line (`cmd`) and run:

Right-click Docker icon in the task bar, then click `Settings`, then `Shared drives`, then check `C`, then click `Apply` and enter your Windows password.

```sh
mkdir "C:\%HOMEPATH%\Desktop\node"
docker run -i -t --rm -v "C:\%HOMEPATH%\Desktop\node":/git alpine/git clone https://github.com/gorankarlic/lecture-dlt.git
```

### 2.2 Update the repository

On Mac, open the Terminal (`Terminal`) app and run:

```sh
docker run -i -t --rm -v ~/Desktop/node/lecture-dlt:/git alpine/git pull --all
```

On Windows, open the Command Line (`cmd`) and run:

Right-click Docker icon in the task bar, then click `Settings`, then `Shared drives`, then check `C`, then click `Apply` and enter your Windows password.

```sh
docker run -i -t --rm -v "C:\%HOMEPATH%\Desktop\node\lecture-dlt":/git alpine/git pull --all
```

## 3. Change directory

On Mac:

```sh
cd ~/Desktop/node/lecture-dlt
```

On Windows:

```sh
cd "C:\%HOMEPATH%\Desktop\node\lecture-dlt"
```

## 4. Start mining / exploring

### 4.1 Start mining

```sh
docker-compose build && docker-compose run --rm node
```

### 4.2 Start a console

```sh
docker-compose build && docker-compose run --rm console
```

To experiment with the commands look at the documentation:

- Management API (fully available in the Geth console)

  [https://github.com/ethereum/go-ethereum/wiki/Management-APIs](https://github.com/ethereum/go-ethereum/wiki/Management-APIs)

- JavaScript API (partially available in the Geth console, used to write apps)

  [https://github.com/ethereum/wiki/wiki/JavaScript-API](https://github.com/ethereum/wiki/wiki/JavaScript-API)

#### 4.2.1 Console cheat-sheet

```sh
eth.accounts
eth.getBlock(7)

eth.getBalance(eth.accounts[0])
web3.fromWei(eth.getBalance(eth.accounts[0]), "ether")

web3.eth.sendTransaction({from:eth.accounts[0],to:eth.accounts[0],value:1})
eth.getTransaction("0xce71b99944a4f0fa06649d6c236e717b18fde34b55a2e89924ad7c0d3bc8c710")

eth.peers
txpool
```