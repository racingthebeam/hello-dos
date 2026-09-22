# Makefile - runs on host system

all: game
clean: clean_game

run: all
	./scripts/run

#
# Game - build in container

game:
	./scripts/make

clean_game:
	./scripts/make clean

.PHONY: \
	all clean run \
	game clean_game

