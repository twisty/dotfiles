install:
	ln -s $(CURDIR)/colordiffrc $(HOME)/.colordiffrc
	ln -s $(CURDIR)/screenrc $(HOME)/.screenrc
	ln -s $(CURDIR)/zshrc $(HOME)/.zshrc
	ln -s $(CURDIR)/zshenv $(HOME)/.zshenv
	ln -s $(CURDIR)/nanorc $(HOME)/.nanorc
	ln -s $(CURDIR)/vimrc.after $(HOME)/.vimrc.after

uninstall:
	rm -f $(HOME)/.colordiffrc
	rm -f $(HOME)/.screenrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.zshenv
	rm -f $(HOME)/.nanorc
	rm -f $(HOME)/.vimrc.after
