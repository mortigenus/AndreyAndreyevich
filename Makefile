prefix ?= /usr/local
bindir = $(prefix)/bin

.PHONY: build
build:
	swift build -c release -Xswiftc -cross-module-optimization

.PHONY: install
install: build
	install .build/release/markov $(bindir)

.PHONY: clean
clean:
	swift package clean
