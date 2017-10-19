# Created by newuser for 5.4.2
source /usr/share/custom/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme bira

# Tell Antigen that you're done.
antigen apply

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ -z $XDG_SESSION_TYPE ]]; then
  XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
fi

# Cask
export PATH="/home/vf/.cask/bin:$PATH"

# Go
export PATH=$PATH:/usr/local/go/bin
