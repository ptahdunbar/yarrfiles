#!/bin/sh

# Easy hosts file tweaks
alias hosts='sudo vi /etc/hosts'

# Easy path navigation: .., ..., ...., ....., ~ and -
# TODO: make a function for this.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias cl="clear"
alias q="exit"

# File listing
alias ll='ls -al'
alias l="ls -Gl" # List all files colorized in long format
alias la="ls -Gla" # List all files colorized in long format, including dot files
alias lsd='ls -l | grep "^d"' # List only directories

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com" # osx

# Set the operating system global
if [ 'Darwin' == `uname` ]; then YARR_OS='osx'; elif [ 'Linux' == `uname` ]; then YARR_OS='linux'; else YARR_OS='yarr'; fi;
export YARR_OS=$YARR_OS;

# Make vim the default editor
export EDITOR="vim"


# Start an HTTP server from a directory, optionally specifying the port
function srv() {
	local port="${1:-8000}"
	open "http://localhost:${port}/"
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}


alias www='cd ~/Sites'
alias dl="cd ~/Downloads"
alias db="cd ~/Dropbox"

alias o="open"
alias oo="open ."

alias flush="dscacheutil -flushcache" # Flush Directory Service cache

# Recursively delete `.DS_Store` files
alias dscleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# source ~/.localrc if available.
[ -f ~/.localrc ] && source ~/.localrc;

# Greetings, Earthlings. We have now taken over your shell!
echo "Welcome to the Matrix (`echo $YARR_OS | tr '[a-z]' '[A-Z]'` Edition): 101010001110010111"


