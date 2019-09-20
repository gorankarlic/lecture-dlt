# WHU Blockchain

## 1. Install Docker

On Mac:

[https://download.docker.com/mac/stable/Docker.dmg]()

On Windows:

[https://download.docker.com/win/stable/Docker for Windows Installer.exe]()

## 2. Clone this repository

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

To experiment with the commands look at the documentation [https://github.com/ethereum/go-ethereum/wiki/Management-APIs]().
