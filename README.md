# WHU Blockchain

## 1. Install Docker

On Mac:

[https://download.docker.com/mac/stable/Docker.dmg]()

On Windows:

[https://download.docker.com/win/stable/Docker for Windows Installer.exe]()

## 2. Clone this repository

On Mac:

```sh
docker run -i -t --rm -v ~/Desktop/node:/git alpine/git clone https://github.com/gorankarlic/lecture-dlt.git
```

On Windows:

```sh
docker run -i -t --rm -v %HOMEPATH%/Desktop/node:/git alpine/git clone https://github.com/gorankarlic/lecture-dlt.git
```

## 3. Change directory

On Mac:

```sh
cd ~/Desktop/node
```

On Windows:

```sh
cd %HOMEPATH%/Desktop/node
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

