CXX := i586-pc-msdosdjgpp-g++

FLAGS := -I/allegro -L/allegro -march=i586 -O2 -Wall
CFLAGS := $(FLAGS) -fgnu89-inline
CXXFLAGS := $(FLAGS)

SRC := src/main.cpp

BUILD_DIR := build
BUILD_EXE := $(BUILD_DIR)/GAME.EXE

all: $(BUILD_EXE)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	cp support/CWSDPMI.EXE $(BUILD_DIR)

$(BUILD_EXE): $(BUILD_DIR) $(SRC)
	$(CXX) $(SRC) $(CXXFLAGS) -lalleg -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean

