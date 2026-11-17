# A Linux environment with everything the labs, builds and notes need.
# You don't use this file directly. Run ./tools/linux-shell.sh instead.
FROM ubuntu:24.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential gdb strace ltrace valgrind \
      tcpdump iproute2 iputils-ping netcat-openbsd dnsutils curl ca-certificates \
      man-db manpages-dev manpages-posix-dev less vim nano git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /work
CMD ["bash"]
