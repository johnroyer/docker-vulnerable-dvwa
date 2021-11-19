# Damn Vulnerable Web Application Docker container
[![Docker Pulls](https://img.shields.io/docker/pulls/vulnerables/web-dvwa.svg?style=plastic)](https://hub.docker.com/r/vulnerables/web-dvwa/)
![License](https://img.shields.io/badge/License-GPL-blue.svg?style=plastic)

Damn Vulnerable Web Application (DVWA) is a PHP/MySQL web application that is damn vulnerable. Its main goal is to be an aid for security professionals to test their skills and tools in a legal environment, help web developers better understand the processes of securing web applications and to aid both students & teachers to learn about web application security in a controlled class room environment.

The aim of DVWA is to practice some of the most common web vulnerability, with various difficultly levels, with a simple straightforward interface. Please note, there are both documented and undocumented vulnerability with this software. This is intentional. You are encouraged to try and discover as many issues as possible.

**WARNING** This image is vulnerable to several kinds of attacks, please don't deploy it to any public servers.

## Run this image

Check configurations in these files:

- `.env`
- `php.ini`
- `www.conf`
- `config.inc.php` (DVWA site configs)

then run docker with:

    docker run --name dvwa -d --env-file .env

or add hardware limitations:

    docker run --name dvwa -d --env-file .env -m 1G --cpus="1.5" dvwa:latest


## Login with default credentials

To login you can use the following credentials:

  * Username: admin
  * Password: password

## Set the dificulty level

The default dificulty level is the ```impossible``` level, you can change it in ```DVWA Security``` item in the left menu.

![dificulty](https://github.com/opsxcq/docker-vulnerable-dvwa/blob/master/setup-dificulty.png?raw=tru)

