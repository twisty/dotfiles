#!/bin/sh

# Dock
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock orientation left
defaults write com.apple.dock pinning end
defaults write com.apple.dock showhidden 1

# Quit printer application when finished
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save screenshots on Dropbox
defaults write com.apple.screencapture location ~/Dropbox/Screenshots
