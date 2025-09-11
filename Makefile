.PHONY: dotfiles

DOTFILES := $(shell pwd)
DARWIN := $(shell uname | grep Darwin)

install: zshrc gitconfig ~/.config/nvim ~/.wezterm.lua ~/.docker/config.json

~/.oh-my-zsh:
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

~/.dotfiles:
	echo "export DOTFILES=$(DOTFILES)" > ~/.dotfiles

zshrc: ~/.oh-my-zsh ~/.dotfiles direnv
	grep "\.dotfiles" ~/.zshrc || echo ". $(HOME)/.dotfiles" > ~/.zshrc
	grep "$(DOTFILES)/zsh/rc" ~/.zshrc || echo "source \$$DOTFILES/zsh/rc" >> ~/.zshrc
	[ $(USER) = key ] && grep "zsh/keyrc" ~/.zshrc || echo "source \$$DOTFILES/zsh/keyrc" >> ~/.zshrc

direnv:
ifneq ($(DARWIN),)
	which direnv > /dev/null 2>&1 || brew install direnv
else
	which direnv > /dev/null 2>&1 || sudo apt-get install -y direnv
endif
	mkdir -p ~/.config/direnv
	[ -f ~/.config/direnv/direnv.toml ] || cp $(DOTFILES)/zsh/direnv.toml ~/.config/direnv/

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
