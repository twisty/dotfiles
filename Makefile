install: uninstall defaults
	ln -s $(CURDIR)/colordiffrc $(HOME)/.colordiffrc
	ln -s $(CURDIR)/editorconfig $(HOME)/.editorconfig
	ln -s $(CURDIR)/gitexcludes $(HOME)/.gitexcludes
	ln -s $(CURDIR)/screenrc $(HOME)/.screenrc
	ln -s $(CURDIR)/tmux.conf $(HOME)/.tmux.conf
	ln -s $(CURDIR)/oh-my-zsh $(HOME)/.oh-my-zsh
	ln -s $(CURDIR)/zshrc $(HOME)/.zshrc
	ln -s $(CURDIR)/zshenv $(HOME)/.zshenv
	ln -s $(CURDIR)/nanorc $(HOME)/.nanorc
	ln -s $(CURDIR)/vimrc $(HOME)/.vimrc

uninstall:
	rm -f $(HOME)/.colordiffrc
	rm -f $(HOME)/.editorconfig
	rm -f $(HOME)/.gitexcludes
	rm -f $(HOME)/.screenrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.oh-my-zsh
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.zshenv
	rm -f $(HOME)/.nanorc
	rm -f $(HOME)/.vimrc

update: update-git install

update-git:
	git pull
	git submodule foreach git pull

defaults:
	git config --global color.ui true
	git config --global color.diff.meta yellow black
	git config --global core.excludesfile '~/.gitexcludes'

defaults-mac:
	defaults write com.apple.screencapture location ~/Dropbox/Screenshots
