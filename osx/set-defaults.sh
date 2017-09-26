# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.

# Global Setup

## Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "MacBook Pro"
sudo scutil --set HostName "MacBook Pro"
sudo scutil --set LocalHostName "MacBook-Pro"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "MacBook-Pro"

## Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

# 24-Hour Time
defaults write NSGlobalDomain AppleICUForce12HourTime -bool true

## Show the ~/Library folder.
chflags nohidden ~/Library

## Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Screen

## Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Laptop

## Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true
# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# General
# ==============================================
echo "Setting General preferences"

# Use dark meny bar and dock (ligh, dark).
defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

# Automatically hide and show the menu bar (false, true).
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Show scroll bars (WhenScrolling, Automatic, Always).
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Click in the scroll bar to.
# @TODO "Jump to the Spot that's clicked".

# Restart for changes.
killall Dock;killall SystemUIServer;killall Finder

# Desktop & Screen Saver
# ==============================================
echo "Setting Desktop & Screen Saver preferences"

# Dock
# ==============================================
echo "Setting Dock preferences"

# Position (left, bottom, right)
defaults write com.apple.dock orientation -string "right"

# Icon Size (32)
defaults write com.apple.dock tilesize -int 32

# Set the Scale Effect to Minimize Windows (genie, scale, suck)
defaults write com.apple.dock mineffect -string scale

# Hide Show Dock
defaults write com.apple.dock autohide -bool true

# Restart dock for changes
killall Dock

# Mission Control
# ==============================================
echo "Setting Mission Control preferences"

# Automatically rearrange Spaces beased on most recent use (true, false).
defaults write com.apple.dock mru-spaces -bool false

# Hot Corners

# Bottom Left – Mission Control
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0

# Security & Privacy
# ==============================================
echo "Setting Security & Privacy preferences"

# Require password (immediately) after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Spotlight
# ==============================================
echo "Setting Spotlight preferences"

# @TODO Remove 'Spotlight Suggestions' from Search Results.

# Finder
# May require `killall Finder` before these take effect

## Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

## Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

## Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

## Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Mac App Store

## Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

## Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Dropbox

## Remove Dropbox’s green checkmark icons in Finder
file=/Applications/Dropbox.app/Contents/Resources/check.icns
[ -e "$file" ] && mv -f "$file" "$file.bak"
unset file
