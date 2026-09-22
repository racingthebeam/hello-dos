# hello-dos

A minimal starting point for making a C++ game with DJGPP 12.2 and Allegro 4.2.3.

I threw this together because I wanted to be able to easily work on my [2026 DOS jam](https://itch.io/jam/ms-tres) entry across a couple of different machines. Tested on Linux (amd64) and macOS (Apple Silicon).

## Features

  - Toolchain lives in a Docker container - nothing to faff around with locally
  - Integrated Allegro 4.2.3
  - Bundles CWSDPMI.EXE for protected mode support
  - Includes a small example "Hello World" program, by Michiel Sikma

## Bundled Libraries

  - `jgmod` - tracker music player

## Requirements

  - Docker
  - `dosbox` must be in your path to run the executables (adjustable in `.env`)

## Usage

  - Clone this repo
  - (optional) Edit `.env` and source into environment
  - Run `./scripts/build-image`
  - To build project in the container: `make game`
  - To run in DOSBox: `make run`

`Makefile.build` contains the build rules that run in the container, and `Makefile` is its locally invokable wrapper. `Makefile` is also a good place for putting other non-container tasks, such as your asset pipeline. The provided files are deliberately spartan - modify to taste!

Additional scripts:

  - `./scripts/shell` - open an interactive shell inside the build container
  - `./scripts/dosbox` - run DOSBox, with the `build` directory mounted at `C:`

## Copyright & License

Assembled by [rtb](https://github.com/racingthebeam), with a lot of help from Google; sources cited throughout the code. No license asserted, use however or for whatever you like...
