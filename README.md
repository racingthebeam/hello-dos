# hello-dos

A minimal starting point for making a C++ game with DJGPP 14.2 and Allegro.

I threw this together because I wanted to be able to easily work on my [2026 DOS jam](https://itch.io/jam/ms-tres) entry across a couple of different machines. Tested on Linux (amd64) and macOS (Apple Silicon).

## Features

  - Toolchain lives in a Docker container - nothing to faff around with locally
  - Integrated Allegro 4.2.3
  - Bundles CWSDPMI.EXE for protected mode support
  - Includes a small example "Hello World" program, by Michiel Sikma

## Requirements

  - Docker
  - `dosbox` must be in your path to run the executables (adjustable in `./scripts/run`)

## Usage

  - Clone this repo
  - Run `./scripts/build-image`
  - To build project in the container: `./scripts/make`
  - To run in DOSBox: `./scripts/run`

The provided `Makefile` is deliberately spartan - modify to taste. Remember: `make` runs inside the container, invoking it directly from the host machine is futile!

Finally - if you need an interactive shell, `./scripts/shell` is the command for you!

## Copyright & License

Assembled by [rtb](https://github.com/racingthebeam), with a lot of help from Google; sources cited throughout the code. No license asserted, use however or for whatever you like...
