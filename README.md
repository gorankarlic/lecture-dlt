# 📧 Crypto Lab

## 1. Install Docker Desktop

On Mac:

[https://docs.docker.com/desktop/setup/install/mac-install/](https://docs.docker.com/desktop/setup/install/mac-install/)

On Windows:

[https://docs.docker.com/desktop/setup/install/windows-install/](https://docs.docker.com/desktop/setup/install/windows-install/)

## 2. Run Debian linux

### 2.1 Mac

Open the Terminal (`Terminal`) app and run:

```sh
docker run -it debian
```

### 2.2 Windows

#### 2.2.1 Instal Terminal app

It is recommended that you install the Terminal app for Windows available at:

[https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)

#### 2.2.2 Run

Open the Terminal (`Terminal`) app and run:

```sh
docker run -it debian
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
openssl pkeyutl -encrypt -pubin -inkey public.txt -in message.txt -out encrypted.bin
```

#### 4.3.2 Show encrypted ciphertext

Show the encrypted ciphertext:

```sh
base64 encrypted.bin
```

#### 4.3.3 Decrypt the ciphertext

Decrypt the ciphertext using the private key:

```sh
openssl pkeyutl -decrypt -inkey private.txt -in encrypted.bin -out decrypted.txt
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
