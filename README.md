# financial-rag-core-cs

The Core CS wing of **QFIS**. We learn operating systems and computer networks by building real systems in C and C++. Some of those systems will later power parts of [FinForge](https://github.com/Q-FIS/Finforge-ai), the club's financial document assistant.

**Goal for the end of January:** every member can explain and trace processes, memory, files, threads, sockets and TCP on a real Linux system, and has gone deep on at least two topics.

## Where things go

| What | Where | Who reviews it |
|---|---|---|
| **Labs**: your individual exercises | **Your own GitHub repo**, started from [`templates/lab-repo`](templates/lab-repo/) | Nobody needs to. It's your space. |
| **Builds**: team projects | [`builds/`](builds/) in this repo | Any one member |
| **Notes**: one explainer per topic, read by everyone | [`notes/`](notes/) in this repo | Any one member |
| **Experiments** you aren't ready to share | `sandbox/` (git ignores this folder) | Nobody. It is never pushed. |

## Builds

This table lists every team project in the repo. When you start a build, add a row in the same pull request.

| Build | Team | What it does | Status | Joins FinForge? |
|---|---|---|---|---|
| *No builds yet. Yours could be the first.* | | | | |

Status is one of `planning`, `in progress`, `working` or `done`.

## Notes

Each member writes about two topics, and everyone reads everyone else's. The full topic list, owners and reading rotation are in [notes/README.md](notes/README.md). Start with the example note, [fork, exec and wait](notes/os/fork-exec-wait.md).

## Getting started

You need **Linux** for most of this work, because `strace`, `epoll` and `/proc` only exist there.

| Your computer | What to do |
|---|---|
| Linux | Install the tools: `sudo apt install build-essential gdb strace tcpdump` |
| Windows | Install [WSL](https://learn.microsoft.com/windows/wsl/install) with Ubuntu, then run the Linux command above inside it |
| macOS | Install [Docker Desktop](https://www.docker.com/products/docker-desktop/), then run `./tools/linux-shell.sh` from this repo. It opens a Linux shell with every tool already installed. |

Then check that everything works:

```bash
git clone https://github.com/Q-FIS/financial-rag-core-cs.git
cd financial-rag-core-cs
make -C templates/build run
# Core CS build template is working.
```

Your first contribution is adding yourself to [members.md](members.md). [CONTRIBUTING.md](CONTRIBUTING.md) walks you through it step by step.

## Plan

| Weeks | Focus | Notes due |
|---|---|---|
| 0 | Setup: Git, your lab repo, your first pull request | Your row in `members.md` |
| 1–5 | **Operating systems**: processes → memory → files → threads | OS topics, in the order of the topic table |
| 6–10 | **Computer networks**: sockets → TCP → many clients → protocols | CN topics, in the order of the topic table |

Labs follow the same order, so each note lands just before the lab that needs it.

## How this repo relates to FinForge

FinForge is written in Python and has its own component registry. This repo is separate, and its "registry" is just the builds table above. Most builds stay here. When a build is useful to FinForge (for example a fast inverted index or a storage engine), the leads help wrap it as a FinForge component. You don't need to plan for that at the start. Just tick "Joins FinForge?" in the table if you think it might.

## Repo layout

```text
README.md          this page, including the builds table
CONTRIBUTING.md    how to contribute, step by step
members.md         everyone in the wing and their lab repos
builds/            team projects, one folder each
notes/             the shared knowledge base (notes/os, notes/cn)
templates/         starters for a build, a note and your lab repo
tools/             the Linux environment for macOS users
.github/           pull request and issue forms, and the build check
```

## License

[Apache License 2.0](LICENSE), the same as FinForge. By contributing, you agree that your contribution is shared under this license.
