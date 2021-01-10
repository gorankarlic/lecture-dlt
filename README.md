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

## 4. "Look ma, I gots them blockchains!"

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
geth --verbosity 1 console
```

### 4.2.1 View block headers

To view the headers of block number `3`:

```
web3.eth.getBlock(3)
```

Commands are explained in the [Web3 documentation](https://github.com/ChainSafe/web3.js/blob/0.20.7/DOCUMENTATION.md#web3ethgetblock).

### 4.2.2 View some funny stuff in block number 14000

```
web3.toAscii(web3.eth.getBlock(14000).extraData)
```

Enter `exit` to exit from the console.

# 𓀄 Crypto Lab

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

#### 2.3 Install OpenSSL

Install the cryptographic library [OpenSSL](https://www.openssl.org):

```sh
apt-get update && apt-get install openssl
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
