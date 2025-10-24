.PHONY: ~/.dotfiles

DOTFILES := $(shell pwd)
DARWIN := $(shell uname | grep Darwin)

install: zshrc gitconfig ~/.config/nvim ~/.wezterm.lua ~/.docker/config.json

~/.oh-my-zsh:
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

~/.dotfiles:
	echo "export DOTFILES=$(DOTFILES)" > ~/.dotfiles

zshrc: ~/.oh-my-zsh ~/.dotfiles
	grep "\.dotfiles" ~/.zshrc || echo ". $(HOME)/.dotfiles" > ~/.zshrc
	grep "$(DOTFILES)/zsh/rc" ~/.zshrc || echo "source \$$DOTFILES/zsh/rc" >> ~/.zshrc
	[ $(USER) = key ] && grep "zsh/keyrc" ~/.zshrc || echo "source \$$DOTFILES/zsh/keyrc" >> ~/.zshrc

gitconfig: ~/.gitignore
	grep include ~/.gitconfig || echo "[include]\n\tpath = $(DOTFILES)/git/config" >> ~/.gitconfig

~/.gitignore:
	cp $(DOTFILES)/git/ignore ~/.gitignore

~/.config/nvim:
	mkdir -p ~/.config
	ln -s $(DOTFILES)/lazyvim ~/.config/nvim

~/.docker/config.json:
	mkdir -p ~/.docker
	cp $(DOTFILES)/docker/config.json ~/.docker/config.json

docker-compose:
	grep "docker-compose" ~/.zshrc || echo 'source \$$DOTFILES/zsh/docker-compose' >> ~/.zshrc

~/.wezterm.lua: sleepwatcher-wezterm
ifneq ($(DARWIN),)
	sed s:__dotfiles__:$(DOTFILES): wezterm.lua > ~/.wezterm.lua
endif

sleepwatcher-wezterm:
ifneq ($(DARWIN),)
	git clone https://github.com/kosmatov/sleepwatcher-wezterm
endif

clean:
	rm ~/.dotfiles ~/.zshrc ~/.gitconfig ~/.gitignore ~/.config/nvim ~/.wezterm.lua

cargo:
	curl https://sh.rustup.rs -sSf | sh

git-hooks:
	cp $(DOTFILES)/git/hooks/* .git/hooks/

build-node-tools:
	@docker image ls | grep -q dotfiles-node-tools || docker compose -f $(DOTFILES)/docker-compose.yml build node-tools

node-container: build-node-tools
	$(eval export NODE_CONTAINER ?= $(shell docker container ls --filter "name=node-tools" --format "{{.Names}}"))
	$(if $(NODE_CONTAINER),,$(eval export NODE_CONTAINER := $(shell docker compose -f $(DOTFILES)/docker-compose.yml up -d node-tools 2>&1 | cut -d\  -f3)))

codex: node-container
	docker exec -it $(NODE_CONTAINER) $(MAKECMDGOALS)

copilot: node-container
	docker exec -it $(NODE_CONTAINER) copilot

node: node-container
	docker exec -it $(NODE_CONTAINER) node

%:
	echo done
