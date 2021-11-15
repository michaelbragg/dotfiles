#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

################################################################################
# General UI/UX                                                                #
################################################################################

# Set computer name (as done via System Preferences → Sharing)

sudo scutil --set ComputerName "Thoughts & Ideas"
sudo scutil --set HostName "ti-macbookpro-100"
sudo scutil --set LocalHostName "ti-macbookpro-100"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "ti-macbookpro-100"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Use dark meny bar and dock (ligh, dark).
defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

# Stop clock spearators from flashing
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "false"

# Set date format
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MMM d j:mm a\""

# Automatically hide and show the menu bar (false, true).
defaults write NSGlobalDomain "_HIHideMenuBar" -bool true

killall SystemUIServer

################################################################################
# Dock, Dashboard, and hot corners                                             #
################################################################################

# Position (left, bottom, right)
defaults write com.apple.dock "orientation" -string "right"

# Icon Size (36)
defaults write com.apple.dock "tilesize" -int 36

# Autohide the Dock
defaults write com.apple.dock "autohide" -bool "true"

# Set the Scale Effect to Minimize Windows (genie, scale, suck)
defaults write com.apple.dock "mineffect" -string "scale"

# Show recently used apps in dock. (true, false)
defaults write com.apple.dock "show-recents" -bool "false"

# Automatically rearrange Spaces beased on most recent use (true, false).
defaults write com.apple.dock "mru-spaces" -bool "false"

# Bottom Left – Mission Control
defaults write com.apple.dock "wvous-bl-corner" -int 2
defaults write com.apple.dock "wvous-bl-modifier" -int 0

# Restart dock for changes
killall Dock

################################################################################
# Screen                                                                       #
################################################################################

# Remove the default shadow from screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# Set screenshot location
mkdir -p ~/Downloads/Screenshots
defaults write com.apple.screencapture "location" -string "~/Downloads/Screenshots"

################################################################################
# Finder                                                                       #
################################################################################

# Show scroll bars (WhenScrolling, Automatic, Always).
defaults write NSGlobalDomain "AppleShowScrollBars" -string "WhenScrolling"

# Show all filename extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Remove file extension warning
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Save to disk by default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Set sidebar icon size
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "3"

## Expand save panel by default
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool "true"

# Expand print panel by default
defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint" -bool "true"

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate "ScheduleFrequency" -int "1"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"

## Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"

# Require password (immediately) after sleep or screen saver begins.
defaults write com.apple.screensaver "askForPassword" -int "1"
defaults write com.apple.screensaver "askForPasswordDelay" -int "0"

## Finder: show status bar
defaults write com.apple.finder "ShowStatusBar" -bool "true"

# Disable the warning when changing a file extension
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

## Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true"

killall Finder

################################################################################
# Peripherals                                                                  #
################################################################################

# Restart Required @TODO find comand to reset Bluetooth settings.
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse "MouseButtonMode" -string "TwoButton"

# Show sound in memnu bar always
