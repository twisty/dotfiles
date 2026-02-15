#!/bin/sh

# Dock
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock orientation left
defaults write com.apple.dock pinning end
defaults write com.apple.dock showhidden 1

# Quit printer application when finished
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  # Screenshots location
defaults write com.apple.screencapture location ~/Screenshots

# For vim keybindings in VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
