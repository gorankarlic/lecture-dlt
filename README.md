# WHU Blockchain

## 1. Install Docker

On Mac:

[https://download.docker.com/mac/stable/Docker.dmg](https://download.docker.com/mac/stable/Docker.dmg)

On Windows:

[https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe](https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe)

## 2. Run Debian linux

### 2.1 Mac

Open the Terminal (`Terminal`) app and run:

```sh
docker run -i -t debian:latest
```

### 2.2 Windows

#### 2.2.1 Instal Terminal app

It is recommended that you install the Terminal app for Windows available at:

[https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)

#### 2.2.2 Run

Open the Terminal (`Terminal`) app and run:

```sh
docker run -i -t debian:latest
```
### 2.3 Result

You will evenutually see a line similar to this:

```sh
root@5555b7f58ebe:/#
```

This is the _command prompt_ of the Debian operating system that is now running within a container on your computer.

#### 2.3.1 Verify result
 
Type the following command to show the Debian version:

```sh
cat /etc/debian_version
```

It should output `10.5`.

## 3. Install Ethereum client

### 3.1 Install `wget`

`wget` is a utility which can download files from the internet. To install `wget` run:

```sh
apt-get update && apt-get install -y wget
```

### 3.2 Download `geth`

`geth ` is the most popular Ethereum client. It is written in the _Go_ programming language.

To download `geth` run:

```sh
cd && wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.9.21-0287d548.tar.gz
```

### 3.3 Install `geth`

To unpack and install then downloaded program files run:

```sh
cd && tar -xvf geth-alltools-linux-amd64-1.9.21-0287d548.tar.gz --exclude=COPYING --strip-components=1 && rm geth-alltools-linux-amd64-1.9.21-0287d548.tar.gz && chmod u+x * && mv * /usr/bin
```

### 3.4 Verify result

Type the following command to show the location of the `geth` program:

```sh
which geth
```

It should output `/usr/bin/geth`.

## 4. "Look ma, I gots them blockchains!"

### 4.1 Run your own Ethereum node

You are now ready to participate in the Ethereum network. To start you local node run:

```sh
geth
```

If you follow the output, you will notice that your node will do the following:

1. Find _peers_ 
2. Once found, it will start downloading a local copy of the blockchain

> If it fails to find any peers then your local firewall or network or might be blocking the connection. Try following:
> 
> 1. Temporarily disable your firewall
> 1. Use a less restrictive network, like your mobile phone hotspot

If you want to stop your node press `CTRL+C`.

