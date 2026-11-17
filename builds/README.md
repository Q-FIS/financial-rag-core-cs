# Builds

Each team project lives in its own folder here: `builds/<build-name>/`. Use lowercase words joined by hyphens, for example `mini-shell` or `http-server`.

The list of all builds is the table in the [main README](../README.md#builds). Add your row there in the same pull request that creates your folder.

## Starting a new build

```bash
cp -r templates/build builds/<build-name>
cd builds/<build-name>
make run          # should print "Core CS build template is working."
```

Then fill in `README.md` (keep all the headings) and replace `src/main.c` with your code.

## What every build folder has

```text
builds/<build-name>/
  README.md     what it does, how to run it, how it works, what you learned
  Makefile      copied from the template; usually you only change NAME
  src/          your .c or .cpp files
  include/      your header files (optional)
  tests/        test programs or scripts (optional at first)
```

Builds that may join FinForge later should say so at the top of their README. The leads will help with that step. You don't need to do anything special at the start.
