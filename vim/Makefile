install: uninstall
	mkdir -p ~/.config/nvim
	ln -s $(CURDIR)/vimrc $(HOME)/.vimrc
	ln -s $(CURDIR)/vimrc $(HOME)/.config/nvim/init.vim

uninstall:
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.config/nvim/init.vim
