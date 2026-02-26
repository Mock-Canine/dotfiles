# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

## Make zsh vim-like
bindkey -v
KEYTIMEOUT=1
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
