- [⛓️ Blockchain Lab](#---blockchain-lab)
  * [1. Install Docker](#1-install-docker)
  * [2. Run Debian linux](#2-run-debian-linux)
    + [2.1 Mac](#21-mac)
    + [2.2 Windows](#22-windows)
      - [2.2.1 Instal Terminal app](#221-instal-terminal-app)
      - [2.2.2 Run](#222-run)
    + [2.3 Command prompt](#23-command-prompt)
      - [2.3.1 Verify](#231-verify)
  * [3. Install Ethereum client](#3-install-ethereum-client)
    + [3.1 Install `wget`](#31-install--wget-)
    + [3.2 Download `geth`](#32-download--geth-)
    + [3.3 Install `geth`](#33-install--geth-)
    + [3.4 Verify result](#34-verify-result)
  * [4. 🥨 "Look ma, I gots them blockchains!"](#4---look-ma--i-gots-them-blockchains--)
    + [4.1 Run your own Ethereum node](#41-run-your-own-ethereum-node)
    + [4.2 Interact with the blockchain using your Ethereum node CLI](#42-interact-with-the-blockchain-using-your-ethereum-node-cli)
    + [4.2.1 View peers](#421-view-peers)
    + [4.2.2 View block headers](#422-view-block-headers)
    + [4.2.3 View some funny stuff in block number 14000](#423-view-some-funny-stuff-in-block-number-14000)
    + [4.2.4 Dive deeper into block transactions](#424-dive-deeper-into-block-transactions)
    + [4.2.5 Create a new account](#425-create-a-new-account)
    + [4.2.6 Exit the Geth console](#426-exit-the-geth-console)
- [✉️ Crypto Lab](#---crypto-lab)
  * [1. Install Docker](#1-install-docker-1)
  * [2. Run Debian linux](#2-run-debian-linux-1)
    + [2.1 Mac](#21-mac-1)
    + [2.2 Windows](#22-windows-1)
      - [2.2.1 Instal Terminal app](#221-instal-terminal-app-1)
      - [2.2.2 Run](#222-run-1)
      - [2.3 Install OpenSSL](#23-install-openssl)
  * [3. 🔑 Symetric key cryptography](#3----symetric-key-cryptography)
    + [3.1 Plaintext message](#31-plaintext-message)
      - [3.1.1 Create a message file](#311-create-a-message-file)
      - [3.1.2 Read the message file](#312-read-the-message-file)
    + [3.2 Encryption and decryption](#32-encryption-and-decryption)
      - [3.2.1 Encrypt message](#321-encrypt-message)
      - [3.2.2 Show encrypted ciphertext](#322-show-encrypted-ciphertext)
      - [3.2.3 Decrypt the ciphertext](#323-decrypt-the-ciphertext)
      - [3.2.4 Show decrypted message](#324-show-decrypted-message)
  * [4. 🔐 Asymetric (a.k.a. public / private key) cryptography using RSA](#4----asymetric--aka-public---private-key--cryptography-using-rsa)
    + [4.1 Plaintext message](#41-plaintext-message)
      - [4.1.1 Create a message file](#411-create-a-message-file)
      - [4.1.2 Read the message file](#412-read-the-message-file)
    + [4.2 Create a RSA key pair](#42-create-a-rsa-key-pair)
      - [4.2.1 Create a private key](#421-create-a-private-key)
      - [4.2.1 View the private key](#421-view-the-private-key)
      - [4.2.3 Derive public key](#423-derive-public-key)
      - [4.2.4 View the public key](#424-view-the-public-key)
    + [4.3 Encryption and decryption](#43-encryption-and-decryption)
      - [4.3.1 Encrypt message](#431-encrypt-message)
      - [4.3.2 Show encrypted ciphertext](#432-show-encrypted-ciphertext)
      - [4.3.3 Decrypt the ciphertext](#433-decrypt-the-ciphertext)
      - [4.3.4 Show decrypted message](#434-show-decrypted-message)
  * [5. 🔏Asymetric (a.k.a. public / private key) cryptography using EC](#5---asymetric--aka-public---private-key--cryptography-using-ec)
    + [5.1 Plaintext message](#51-plaintext-message)
      - [5.1.1 Create a message file](#511-create-a-message-file)
      - [5.1.2 Read the message file](#512-read-the-message-file)
    + [5.2 Create a EC key pair](#52-create-a-ec-key-pair)
      - [5.2.1 Create a private key](#521-create-a-private-key)
      - [5.2.2 View the private key](#522-view-the-private-key)
      - [5.2.3 Derive public key](#523-derive-public-key)
      - [5.2.4 View the public key](#524-view-the-public-key)
    + [5.3 Sign and verify](#53-sign-and-verify)
      - [5.3.1 Sign message](#531-sign-message)
      - [5.3.2 Show signature](#532-show-signature)
      - [5.3.3 Verify the signature](#533-verify-the-signature)
      - [5.3.4 Alter message](#534-alter-message)
      - [5.3.5 Verify the signature again](#535-verify-the-signature-again)


# ⛓️ Blockchain Lab

## 1. Install Docker

On Mac:

[https://download.docker.com/mac/stable/Docker.dmg](https://download.docker.com/mac/stable/Docker.dmg)

On Windows:

[https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe](https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe)

## 2. Run Debian linux

### 2.1 Mac

Open the Terminal (`Terminal`) app and run:

```sh
docker run -it debian:latest
```

### 2.2 Windows

#### 2.2.1 Instal Terminal app

It is recommended that you install the Terminal app for Windows available at:

[https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)

#### 2.2.2 Run

Open the Terminal (`Terminal`) app and run:

```sh
docker run -it debian:latest
```

### 2.3 Command prompt

You will evenutually see a line similar to this:

```sh
root@5555b7f58ebe:/#
```

This is the _command prompt_ of the Debian operating system that is now running within a container on your computer.

#### 2.3.1 Verify
 
Type the following command to show the Debian version:

```sh
cat /etc/debian_version
```

It should output `10.7`.

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
cd && wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.9.25-e7872729.tar.gz
```

### 3.3 Install `geth`

To unpack and install then downloaded program files run:

```sh
cd && tar -xvf geth-alltools-linux-amd64-1.9.25-e7872729.tar.gz --exclude=COPYING --strip-components=1 && rm geth-alltools-linux-amd64-1.9.25-e7872729.tar.gz && chmod u+x * && mv * /usr/bin
```

### 3.4 Verify result

Type the following command to show the location of the `geth` program:

```sh
which geth
```

It should output `/usr/bin/geth`.

## 4. 🥨 "Look ma, I gots them blockchains!"

### 4.1 Run your own Ethereum node

You are now ready to participate in the Ethereum network. To start you local node run:

```sh
geth
```

If you follow the output, you will notice that your node will do the following:

1. Find _peers_ 
2. Once found, it will start downloading a local copy of the blockchain

> If it fails to find any peers, it might be because your operating system firewall or the network is blocking the connections.
> 
> Try following:
>
> 1. Connect to a less restrictive network, like your mobile phone hotspot
> 1. ⚠️ Temporarily disable the firewall in the operating system settings (do not forget to enable the firewall after lab session)

If you want to stop your node press `CTRL+C`.

### 4.2 Interact with the blockchain using your Ethereum node CLI

To interact with the blockchain using your Ethereum node's CLI (command line interface a.k.a. console) run:

```sh
geth --syncmode light --verbosity 1 console
```

> You can find the reference for the console commands in the [Web3 documentation](https://web3js.readthedocs.io/en/v1.2.11/).

### 4.2.1 View peers

To view the peer nodes that you are currently connected to:

```js
admin.peers
```

You will notice that each peer has a remote IP address (here the IP address is `94.176.237.140`):

```js
remoteAddress: "94.176.237.140:30303"
```

You can query the peer's IP address using a [Geolocation tool](https://tools.keycdn.com/geo) to find out where they are.

### 4.2.2 View blocks

Take a look at block number `3`:

```js
eth.getBlock(3)
```

Take a look at the latest block number:

```js
eth.blockNumber
```

Take a look at the latest block:

```js
eth.getBlock(eth.blockNumber)
```

### 4.2.3 View some funny stuff in block number 14000

Block number `14000` has an interesting message in it's _extra data_:

```js
web3.toAscii(eth.getBlock(14000).extraData)
```

Now take look at the _extra data_ in the latest block:

```js
web3.toAscii(eth.getBlock(eth.blockNumber).extraData)
```

### 4.2.4 Dive deeper into block transactions

Take a look at block `1000000`:

```js
eth.getBlock(1000000)
```

Block `1000000` has two transactions. Take a look at the first transaction in that block:

```js
eth.getTransaction("0xea1093d492a1dcb1bef708f771a99a96ff05dcab81ca76c31940300177fcf49f")
```

Take a look at how much Ether the account that mined the last block has:

```js
web3.fromWei(eth.getBalance(eth.getBlock(eth.blockNumber).miner), "Ether")
```

### 4.2.5 Create a new account

Create a new account:

```js
personal.newAccount()
```

### 4.2.6 Exit the Geth console

Exit the console:

```js
exit
```

# ✉️ Crypto Lab

## 1. Install Docker

On Mac:

[https://download.docker.com/mac/stable/Docker.dmg](https://download.docker.com/mac/stable/Docker.dmg)

On Windows:

[https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe](https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe)

## 2. Run Debian linux

### 2.1 Mac

Open the Terminal (`Terminal`) app and run:

```sh
docker run -it debian:latest
```

### 2.2 Windows

#### 2.2.1 Instal Terminal app

It is recommended that you install the Terminal app for Windows available at:

[https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)

#### 2.2.2 Run

Open the Terminal (`Terminal`) app and run:

```sh
docker run -it debian:latest
```

#### 2.3 Install OpenSSL

Install the cryptographic library [OpenSSL](https://www.openssl.org):

```sh
apt-get update && apt-get install -y openssl
```

## 3. 🔑 Symetric key cryptography

Encrypt and decrypt a plaintext message with symetric key cryptography.

### 3.1 Plaintext message

#### 3.1.1 Create a message file

Create a file with a message:

```sh
echo Attack at 5:00 > message.txt
```

#### 3.1.2 Read the message file

Read the file with a message:

```sh
cat message.txt
```

### 3.2 Encryption and decryption

#### 3.2.1 Encrypt message

Encrypt the message:

```sh
openssl enc -AES-256-CBC -base64 -pbkdf2 -in message.txt -out encrypted.txt -p -pass pass:password
```

#### 3.2.2 Show encrypted ciphertext

Show the encrypted ciphertext:

```sh
cat encrypted.txt
```

#### 3.2.3 Decrypt the ciphertext

Decrypt the ciphertext:

```sh
openssl enc -AES-256-CBC -base64 -pbkdf2 -in encrypted.txt -out decrypted.txt -p -pass pass:password -d
```

#### 3.2.4 Show decrypted message

Show the decrypted message:

```sh
cat decrypted.txt
```

## 4. 🔐 Asymetric (a.k.a. public / private key) cryptography using RSA

Encrypt and decrypt a plaintext message using the RSA (Rivest–Shamir–Adleman) public / private key cryptography.

### 4.1 Plaintext message

#### 4.1.1 Create a message file

Create a file with a message:

```sh
echo Retreat at 6:00 > message.txt
```

#### 4.1.2 Read the message file

Read the file with a message:

```sh
cat message.txt
```

### 4.2 Create a RSA key pair

#### 4.2.1 Create a private key

Create a private key:

```sh
openssl genpkey -algorithm RSA -out private.txt
```
#### 4.2.1 View the private key

View the created private key:

```sh
cat private.txt
```

#### 4.2.3 Derive public key

Derive a public key:

```sh
openssl rsa -pubout -in private.txt -out public.txt
```
#### 4.2.4 View the public key

View the created public key:

```sh
cat public.txt
```

### 4.3 Encryption and decryption

#### 4.3.1 Encrypt message

Encrypt the message using the public key:

```sh
openssl rsautl -encrypt -pubin -inkey public.txt -in message.txt -out encrypted.bin
```

#### 4.3.2 Show encrypted ciphertext

Show the encrypted ciphertext:

```sh
base64 encrypted.bin
```

#### 4.3.3 Decrypt the ciphertext

Decrypt the ciphertext using the private key:

```sh
openssl rsautl -decrypt -inkey private.txt -in encrypted.bin -out decrypted.txt
```

#### 4.3.4 Show decrypted message

Show the decrypted message:

```sh
cat decrypted.txt
```

## 5. 🔏Asymetric (a.k.a. public / private key) cryptography using EC

Sign and verify a plaintext message using EC (Elliptic-curve) public / private key cryptography.

### 5.1 Plaintext message

#### 5.1.1 Create a message file

Create a file with a message:

```sh
echo Send 1 million USD to John Smith > message.txt
```

#### 5.1.2 Read the message file

Read the file with a message:

```sh
cat message.txt
```

### 5.2 Create a EC key pair

#### 5.2.1 Create a private key

Create a private key:

```sh
openssl ecparam -name secp256k1 -genkey -noout -out private.txt
```

#### 5.2.2 View the private key

View the created private key:

```sh
cat private.txt
```

#### 5.2.3 Derive public key

Derive a public key:

```sh
openssl ec -pubout -in private.txt -out public.txt
```

#### 5.2.4 View the public key

View the created public key:

```sh
cat public.txt
```

### 5.3 Sign and verify

#### 5.3.1 Sign message

Sign the message using the private key:

```sh
openssl dgst -sha256 -sign private.txt -out signature.bin message.txt
```

#### 5.3.2 Show signature

Show the message signature:

```sh
base64 signature.bin
```

#### 5.3.3 Verify the signature

Verify the signature using the public key:

```sh
openssl dgst -sha256 -verify public.txt -signature signature.bin message.txt
```

#### 5.3.4 Alter message

Alter the message:

```sh
echo Send 2 million USD to John Smith > message.txt
```

#### 5.3.5 Verify the signature again 

Verify the signature using the public key:

```sh
openssl dgst -sha256 -verify public.txt -signature signature.bin message.txt
```
