.PHONY: default
default: prepare install

.PHONY: prepare
prepare:
	mkdir -p ~/src/github.com/tarrsalah
	mkdir -p ~/local
	sudo apt-add-repository ppa:git-core/ppa
	sudo add-apt-repository ppa:ubuntu-elisp/ppa
	sudo apt update
	sudo apt install tmux zsh git emacs-snapshot

.PHONY: install
install:
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
