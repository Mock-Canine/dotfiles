# Only run in interactive shells(do not dettach the auto-created main session and create
# a new one, this will create a zombie session)
# If any issue with zsh or tmux, dettach the tmux and the problems may appear
# [[ $- != *i* ]] && return
# # Don't start tmux inside tmux
# if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ]; then
#   tmux attach -t main || tmux new -s main
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

## Make zsh vim-like
bindkey -v
# Used for autosuggestion
bindkey '^f' vi-forward-blank-word
EYTIMEOUT=1
# Prompt the insert and normal mode
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne '\e[1 q'   # block cursor
  else
    echo -ne '\e[5 q'   # beam cursor
  fi
}
zle -N zle-keymap-select
zle-line-init() { zle-keymap-select }
zle -N zle-line-init

## Alias
alias n=nvim
alias nd="nvim -d"

flags='eza --group-directories-first --icons'
alias ls="$flags"
alias ll="$flags -l --git --header --time-style=long-iso"
alias la="$flags -a"
alias lt="$flags --tree --level=3"

## Plugins installed by homebrew go here
source /home/linuxbrew/.linuxbrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Keymaps for autosuggestion
bindkey '^y' autosuggest-execute
bindkey '^u' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init --cmd j zsh)"

# Zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath+=(~/.zfunc)
autoload -Uz compinit && compinit

# Use nvim to open man pages(I have not checked the snippet yet)
# https://neovim.io/doc/user/starting/#_%24vim-and-%24vimruntime
# See the environment variables set when nvim starts up
if [ -z $VIM ]; then
    export MANPAGER="nvim +Man!"
fi
export PATH="/usr/lib/ccache:$PATH"
export NEMU_HOME=/home/zhangyong/ysyx/ysyx-workbench/nemu
export AM_HOME=/home/zhangyong/ysyx/ysyx-workbench/abstract-machine
