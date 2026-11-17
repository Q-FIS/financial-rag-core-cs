# <Topic name>

> **Author:** <your name> (@github-handle) · **Area:** OS | CN · **Last checked on:** <OS and version, e.g. Ubuntu 24.04, kernel 6.8>
> **Related notes:** [other topic](../os/other-topic.md)

## 1. What it is

Three sentences, no jargon you have not explained. If someone reads only this section, they should still know what the topic is and why it exists.

## 2. A tiny program

A complete C program of 20 to 40 lines that uses the thing. It must compile with the command you give.

```c
// paste your program here
```

```bash
cc -Wall -Wextra -g topic.c -o topic && ./topic
```

## 3. What the kernel actually does

Run your program under a tool and paste the **real output** (trim long parts with `...`).

- OS topics: `strace -f ./topic`
- CN topics: `sudo tcpdump -i lo -n port <port>` in one terminal while the program runs in another

```text
paste real output here
```

Then explain the important lines one by one.

## 4. Diagram or step-by-step trace

A picture of what happens, in order. Plain-text diagrams are fine.

## 5. Three mistakes or surprises

1. Something that broke, or that you expected to work differently.
2. ...
3. ...

## 6. Where it lives in the kernel

Link to the real source on [elixir.bootlin.com](https://elixir.bootlin.com/linux/latest/source), for example the function that handles the system call, and say in one or two lines what it does.

## 7. Questions from readers

Answers to the questions people asked on your pull request or afterwards. Keep these. They are often the most useful part.
