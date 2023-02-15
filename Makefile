BIN_NAME := $(shell basename "$PWD")
BIN_DIR := ./out
SRC_DIR := ./src
COMPILED_SOURCES := $(shell find compiled -name '*.dep' -or -name '*.zo')
MAIN := main.rkt
SRC := $(shell find $(SRC_DIR) -name '*.rkt')

all: compile run

compile: $(SRC)
	@ raco make $<
	@ rm -rf ./compiled
	@ mv $(SRC_DIR)/compiled compiled
	
build: $(MAIN)
	@ raco exe $<
	@ mv $(BIN_NAME) $(BIN_DIR)

run:
	@ racket $(MAIN)
