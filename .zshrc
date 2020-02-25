# Lines configured by zsh-newuser-install
#
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joey/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# environment variables
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=kak

# constant local variables
plugin_dir="$XDG_CONFIG_HOME/zsh/plugins"

# load plugins
source "$plugin_dir/vi-mode.zsh"

PROMPT=$'%F{green}%n%f@%F{magenta}%m%f %F{blue}%~%f
 >> '

