install:
	ln -s $(CURDIR)/colordiffrc $(HOME)/.colordiffrc
	ln -s $(CURDIR)/screenrc $(HOME)/.screenrc
	ln -s $(CURDIR)/zshrc $(HOME)/.zshrc
	ln -s $(CURDIR)/nanorc $(HOME)/.nanorc

uninstall:
	rm -f $(HOME)/.colordiffrc
	rm -f $(HOME)/.screenrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.nanorc
