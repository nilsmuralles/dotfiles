# Created by newuser for 5.9
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nils/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# starship
eval "$(starship init zsh)"

# Aliases
alias dotfiles='/usr/bin/git --git-dir=/home/nils/.dotfiles --work-tree=/home/nils'

# Plugins
# Syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Vim Motions
ZVM_VI_ESCAPE_BINDKEY=^J
ZVM_VI_HIGHLIGHT_FOREGROUND=white  
ZVM_VI_HIGHLIGHT_BACKGROUND=#ff0000
zinit light jeffreytse/zsh-vi-mode
