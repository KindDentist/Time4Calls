FROM ubuntu:20.04

MAINTAINER Kind Dentist

ENV TZ=Europe/Moscow
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
xpra \
xterm \
net-tools \
nano \
netcat


CMD ["bash"]
