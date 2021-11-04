.PHONY: default
default: prepare install

.PHONY: prepare
prepare:
	mkdir -p ~/src/github.com/tarrsalah ~/local ~/pkg ~/bin
	sudo apt-add-repository ppa:git-core/ppa
	sudo apt update
	sudo apt install vim tmux zsh git emacs meld silversearcher-ag inotify-tools

.PHONY: install
install:
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
