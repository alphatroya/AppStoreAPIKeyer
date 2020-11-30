prefix ?= /usr/local
bindir = $(prefix)/bin
app_name = "as-keyer"

all: build

## build: launch build
build:
	cargo build

## install: install the application
install:
	cargo install --path .

## uninstall: remove application
uninstall:
	cargo uninstall

## clean: clean build artifacts
clean:
	rm -rf target

## test: Launch unit tests
test:
	cargo test

## fmt: Launch swift files code formatter
fmt:
	cargo fmt

## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: build install uninstall clean help test fmt
