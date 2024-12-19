# docker-ubuntu-lxde-vnc

A simple docker image containing a GUI (lxde), firefox, python

[![Build and Push Docker Image to Docker Hub](https://github.com/JustinGuese/docker-ubuntu-lxde-vnc/actions/workflows/main.yml/badge.svg)](https://github.com/JustinGuese/docker-ubuntu-lxde-vnc/actions/workflows/main.yml)

Dockerhub: https://hub.docker.com/repository/docker/guestros/docker-ubuntu-lxde-vnc/
Github: https://github.com/JustinGuese/docker-ubuntu-lxde-vnc

## Why?

I first tried to use https://github.com/ConSol/docker-headless-vnc-container or https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc/, but they were too old to install new packages.

They also didn't link the Dockerfile, so I couldn't see what they were doing.

Personally I am using this to run a selenium firefox browser with an extension, as I couldn't use it with selenium grid/remote.

## How to use

`docker run -p 5900:5900 guestros/docker-ubuntu-lxde-vnc:latest`

or

`docker compose up`

Then using for example RealVNC Viewer to connect to `localhost:5900` with password `secret`
