# Security

This is a learning repo, but the code is real and runs on real machines and networks. These rules keep everyone safe.

## Never commit secrets

Don't commit passwords, API keys, tokens, private keys, `.env` files or anything from your own accounts. Git keeps history, so a secret deleted in a later commit is still visible.

If you commit one by accident:
1. **Revoke or change the secret first.** Assume it has been seen.
2. Then tell a lead, who will help clean the history.

## Network code

- **Bind servers to `127.0.0.1`** (localhost) unless the exercise needs other machines to connect. A server bound to `0.0.0.0` can be reached by anyone on the same Wi-Fi.
- **Only scan, capture or test against machines you own** or that the exercise gives you. Running `tcpdump` on your own machine's loopback interface is fine. Probing college or public networks is not, and can break rules or laws.
- **Treat everything a client sends as hostile.** Check lengths before copying into buffers, and never pass network input to `system()` or a shell.

## Memory safety

C and C++ will let you write past the end of a buffer without complaint. The template Makefile turns on AddressSanitizer and UndefinedBehaviorSanitizer so these bugs stop the program straight away. Keep them on while developing, and don't remove them to "make the error go away".

## Running other people's code

Read a program before you run it, especially one that deletes files, runs commands or needs `sudo`. Running it inside `./tools/linux-shell.sh` keeps it inside a container, away from your own files outside the folder you mounted.

## Reporting a problem

If you find a security problem in this repo (a leaked secret, or a build that exposes something it shouldn't):

- **Don't open a public issue.**
- Message a Core CS lead directly, or use GitHub's private vulnerability reporting under the repo's **Security** tab if the leads have turned it on.

You'll get a reply within a few days.
