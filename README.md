# Passenger + Nginx + NodeJs

## Build Image

```
docker image build -t passenger-nginx-node:1.0 .
```

## Run Container

```
docker run -it phusion/passenger-nodejs:latest
```

## Docker Cheatsheet

```
docker system prune
docker images -a // LIST
docker rm $(docker ps -a -f status=exited -q) // Remove a container upon exit
docker system prune
```