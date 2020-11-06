prefix ?= /usr/local
bindir = $(prefix)/bin
app_name = "as-keyer"

all: build

## build: launch build
build:
	swift build -c release --disable-sandbox

## install: install the application
install: build
	install ".build/release/AppStoreAPIKeyer" "$(bindir)/$(app_name)"

## uninstall: remove application
uninstall:
	rm -rf "$(bindir)/$(app_name)"

## clean: clean build artifacts
clean:
	rm -rf .build

## project: Generate xcproject file
project:
	swift package generate-xcodeproj

## test: Launch unit tests
test:
	swift test

## fmt: Launch swift files code formatter
fmt:
	mint run swiftformat Sources Tests

## help: Prints help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: build install uninstall clean help test fmt
