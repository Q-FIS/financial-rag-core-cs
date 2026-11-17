#!/usr/bin/env sh
# Opens a Linux shell with this repo mounted at /work.
#
# Use this on macOS, or on Windows without WSL, so that strace, tcpdump,
# epoll and /proc behave exactly as they do on Linux.
# Needs Docker Desktop to be running. The first run takes a few minutes
# to download and install the tools; after that it starts in seconds.
#
#   ./tools/linux-shell.sh            shell in the repo root
#   ./tools/linux-shell.sh ~/my-labs  shell in another folder (e.g. your lab repo)

set -e

IMAGE=qfis-core-cs-linux
HERE=$(cd "$(dirname "$0")" && pwd)
TARGET=$(cd "${1:-$HERE/..}" && pwd)

if ! docker image inspect "$IMAGE" >/dev/null 2>&1; then
    echo "Building the Linux environment (first run only)..."
    docker build -t "$IMAGE" "$HERE"
fi

# SYS_PTRACE and the seccomp setting let strace and gdb work.
# NET_ADMIN and NET_RAW let tcpdump and ping work.
exec docker run -it --rm \
    --cap-add SYS_PTRACE --security-opt seccomp=unconfined \
    --cap-add NET_ADMIN --cap-add NET_RAW \
    -v "$TARGET":/work -w /work \
    "$IMAGE" bash
