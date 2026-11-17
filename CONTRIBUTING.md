# Contributing

Welcome. You don't need any C, C++ or Git experience to start. This guide takes you from nothing to your first merged pull request, then explains how notes and builds work.

**The three rules that matter most**

1. **Small pull requests, often.** One note, or one feature of a build, per pull request.
2. **One approval from any member merges it.** You never have to wait for a lead.
3. **Only real output.** Anything you paste (a trace, a capture, a program's output) must come from something you actually ran.

## Contents

- [One-time setup](#one-time-setup)
- [Your first pull request](#your-first-pull-request)
- [The everyday loop](#the-everyday-loop)
- [Writing a note](#writing-a-note)
- [Working on a build](#working-on-a-build)
- [Your lab repo](#your-lab-repo)
- [Reviewing someone's pull request](#reviewing-someones-pull-request)
- [When you're stuck](#when-youre-stuck)
- [Names and style](#names-and-style)

## One-time setup

1. **Make a GitHub account** if you don't have one, and ask a lead to add you to the `Q-FIS` organisation.
2. **Get a Linux environment.** See [Getting started](README.md#getting-started) in the README. On macOS it's one command: `./tools/linux-shell.sh`.
3. **Install Git and tell it who you are:**
   ```bash
   git config --global user.name  "Your Name"
   git config --global user.email "the-email-on-your-github-account"
   ```
4. **Clone this repo and check that it builds:**
   ```bash
   git clone https://github.com/Q-FIS/financial-rag-core-cs.git
   cd financial-rag-core-cs
   make -C templates/build run
   ```
   You should see `Core CS build template is working.`

## Your first pull request

Everyone's first pull request adds one row to [members.md](members.md). It takes about 15 minutes.

```bash
# 1. Start from the latest main
git switch main
git pull

# 2. Make a branch for your change
git switch -c add-<your-github-handle>

# 3. Edit members.md and add your row, in alphabetical order

# 4. Save the change in Git
git add members.md
git commit -m "Add <your name> to members"

# 5. Send your branch to GitHub
git push -u origin add-<your-github-handle>
```

Git prints a link after the push. Open it and click **Create pull request**. Fill in the form, then ask your buddy (or anyone) to review. Once it's approved, click **Squash and merge**.

That's the whole loop. Everything else in this repo works the same way.

## The everyday loop

```text
git switch main && git pull     get the latest version
git switch -c <branch-name>     one branch per piece of work
... edit, make, test ...
git add <files>                 choose what to save
git commit -m "<what changed>"  save it with a message
git push -u origin <branch>     send it to GitHub
open a pull request → one approval → Squash and merge
```

**Branch names:** `note/<topic>`, `build/<build-name>/<what>`, or `fix/<what>`. For example `note/pipes-dup2` or `build/mini-shell/add-pipes`.

**Commit messages:** say what changed, in plain words. "Add pipes to mini-shell" is better than "update" or "fixes".

**If `git pull` shows a conflict**, don't panic, and don't delete your folder. Ask in the group chat or open a [help issue](../../issues/new/choose). Fixing a conflict together once is the fastest way to learn it.

## Writing a note

1. **Find your topics** in the [topic table](notes/README.md#topic-pool). The leads assign about two per person.
2. **Copy the template:**
   ```bash
   git switch -c note/<topic>
   cp templates/note.md notes/os/<topic>.md      # or notes/cn/
   ```
3. **Fill in all seven sections.** Look at [fork, exec and wait](notes/os/fork-exec-wait.md) to see what "done" looks like. The most important section is 3, "What the kernel actually does". Run your program under `strace` (OS topics) or capture it with `tcpdump` (CN topics), paste the real output, and explain it.
4. **Open the pull request early**, even when the note is half done. Mark it as a draft. People can start asking questions sooner.
5. **When it's merged**, set Status to `done` in the topic table and link your note.

**Questions on your note** come in as pull request comments or "Question about a note" issues. Answer them within a week and add the answers to section 7. This is how the notes get better over time.

## Working on a build

**To start a new build:**
1. Open a [New build proposal](../../issues/new/choose) issue so others can see it and join.
2. Copy the template:
   ```bash
   git switch -c build/<build-name>/start
   cp -r templates/build builds/<build-name>
   make -C builds/<build-name> run
   ```
3. Fill in the build's `README.md` (keep the headings), and add a row to the [builds table](README.md#builds).
4. Open the pull request.

**Building it up:**
- Add one feature per pull request. A shell that runs one command is a fine first pull request, and pipes can come in the next one.
- Run `make` before every push. GitHub runs it too, on every pull request, and shows a red ✗ if the build fails.
- The Makefile turns on sanitizers that stop the program at the first memory bug and print where it happened. If you see `AddressSanitizer` or `runtime error`, read the first few lines of that report. They name the file and line.
- Link to the notes your build relies on, from its README.

## Your lab repo

Labs live in **your own** GitHub repo, not this one, so you can experiment freely.

1. Create an empty repo on your GitHub account, for example `qfis-core-cs-labs`.
2. Copy everything from [`templates/lab-repo`](templates/lab-repo/) into it, including the hidden `.gitignore`.
3. Push it, and add the link to your row in [members.md](members.md).

Each lab gets its own folder (`lab-01`, `lab-02` and so on) with its own Makefile. If something you learned in a lab would help others, turn it into a note or a question here.

## Reviewing someone's pull request

Anyone can review, and you should. Reading other people's code is half of the learning. It takes 10 to 20 minutes.

1. **Run it.** Check out their branch (`git fetch && git switch <branch>`), run `make`, and try the program or the note's code.
2. **Ask at least one question**, even if everything looks right. "Why does this use `_exit` instead of `exit`?" helps you both.
3. **Check the basics:** the pasted output looks real, the README or note keeps the template headings, and the index table is updated.
4. **Approve** when it builds and makes sense. It doesn't have to be perfect, because later pull requests can improve it.

Be kind and specific. Comment on the code, not the person.

## When you're stuck

1. **Read the first error, not the last.** Compilers and sanitizers print the cause first.
2. **Ask your buddy.**
3. **Ask in the group chat**, with the exact command and the full error message as text.
4. **Open a [help issue](../../issues/new/choose)** if it's a problem with a template, the Makefile or the tools.

Being stuck for 30 minutes is normal and useful. Being stuck for a whole day is not. Ask before that happens.

## Names and style

- **Folder and file names:** lowercase words joined by hyphens, for example `mini-shell` or `pipes-dup2.md`.
- **C:** C17. **C++:** C++17, or C++20 if your build needs it. Set this in the Makefile with `STD_C` and `STD_CXX`.
- **Indentation:** 4 spaces in code and tabs in Makefiles. The [`.editorconfig`](.editorconfig) file sets this for you in most editors.
- **Compiler warnings:** fix them, don't silence them. They are usually real bugs.
- **Comments:** explain *why*, not *what*. `// fflush so fork doesn't copy unwritten output` is useful. `// call fflush` is not.
