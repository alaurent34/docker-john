# Docker John
Puts John the Ripper in a container.

Building the container will pull down the latest source from the [github repo](https://github.com/magnumripper/JohnTheRipper).

If you have special requirements for building you should fork this repo and edit the Docker file.

If you want the absolute best performance you should clone this repo and run `docker build . -t=john` on the machine you will be running the container on. It will build with any hardware optimizations your system/kernel provides.

## Examples

Crack local passwords of host system

```
docker run -it --rm john
```
