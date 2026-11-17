# ---------------------------------------------------------------------------
# Starter Makefile for one lab. Copy this folder for each new lab.
#
# You usually only change NAME (and maybe STD_C / STD_CXX).
# Put your .c or .cpp files in src/ and headers in include/. Then:
#
#   make          build the program into build/
#   make run      build, then run it
#   make clean    delete build/
#
# The flags turn on extra warnings and the address and undefined-behaviour
# sanitizers, which catch most memory bugs (out-of-bounds, use-after-free,
# leaks) the moment they happen instead of crashing later.
# ---------------------------------------------------------------------------

NAME    := app

STD_C   := -std=c17
STD_CXX := -std=c++17          # change to -std=c++20 if your build needs it

CC      ?= cc
CXX     ?= c++
WARN    := -Wall -Wextra -Wpedantic
DEBUG   := -g -O0 -fsanitize=address,undefined -fno-omit-frame-pointer
CFLAGS   = $(STD_C) $(WARN) $(DEBUG) -Iinclude
CXXFLAGS = $(STD_CXX) $(WARN) $(DEBUG) -Iinclude
LDFLAGS := -fsanitize=address,undefined
LDLIBS  := -lpthread

SRC_C   := $(wildcard src/*.c)
SRC_CXX := $(wildcard src/*.cpp)
OBJ     := $(SRC_C:src/%.c=build/%.o) $(SRC_CXX:src/%.cpp=build/%.o)

# Link with the C++ compiler if there is any .cpp file, otherwise with the C compiler.
LINKER  := $(if $(SRC_CXX),$(CXX),$(CC))

.PHONY: all run clean

all: build/$(NAME)

build/$(NAME): $(OBJ)
	$(LINKER) $(LDFLAGS) $^ -o $@ $(LDLIBS)

build/%.o: src/%.c | build
	$(CC) $(CFLAGS) -c $< -o $@

build/%.o: src/%.cpp | build
	$(CXX) $(CXXFLAGS) -c $< -o $@

build:
	mkdir -p build

run: build/$(NAME)
	./build/$(NAME)

clean:
	rm -rf build
