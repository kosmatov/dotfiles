DOTFILES := $(shell pwd)
DARWIN := $(shell uname | grep Darwin)

install: zshrc gitconfig ~/.config/nvim ~/.wezterm.lua

~/.oh-my-zsh:
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

~/.dotfiles:
	echo "export DOTFILES=$(DOTFILES)" > ~/.dotfiles

zshrc: ~/.oh-my-zsh ~/.dotfiles
	grep "\.dotfiles" ~/.zshrc || echo ". $(HOME)/.dotfiles" > ~/.zshrc
	grep "$(DOTFILES)/zsh/rc" ~/.zshrc || echo "source $(DOTFILES)/zsh/rc" >> ~/.zshrc
	[ $(USER) = key ] && grep "$(DOTFILES)/zsh/keyrc" ~/.zshrc || echo "source $(DOTFILES)/zsh/keyrc" >> ~/.zshrc

gitconfig: ~/.gitignore
	grep include ~/.gitconfig || echo "[include]\n\tpath = $(DOTFILES)/git/config" >> ~/.gitconfig

~/.gitignore:
	cp $(DOTFILES)/git/ignore ~/.gitignore

~/.config/nvim:
	ln -s $(DOTFILES)/lazyvim ~/.config/nvim

docker-compose:
	grep "docker-compose" ~/.zshrc || echo 'source $(DOTFILES)/zsh/docker-compose' >> ~/.zshrc

~/.wezterm.lua: sleepwatcher-wezterm
ifneq ($(DARWIN),)
	sed s:__dotfiles__:$(DOTFILES): wezterm.lua > ~/.wezterm.lua
endif

sleepwatcher-wezterm:
ifneq ($(DARWIN),)
	git clone https://github.com/kosmatov/sleepwatcher-wezterm
endif
