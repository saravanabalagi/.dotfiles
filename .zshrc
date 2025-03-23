# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
P10K_PROMPT_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$P10K_PROMPT_FILE" ]] && source "$P10K_PROMPT_FILE"

# Homebrew
[[ -f "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# If user has a local bin directory, add it to the path
[ -d "${HOME}/.local/bin" ] && export PATH=${PATH}:${HOME}/.local/bin
[ -d "${HOME}/bin" ] && export PATH=${PATH}:${HOME}/bin

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting
zinit light saravanabalagi/zsh-hist/
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e  # Use emacs keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Use Ctrl Space to complete just one word
# Reference https://github.com/zsh-users/zsh-autosuggestions/issues/265
bindkey '^ ' forward-word

# Use up and down after typing a word to do
# reverse and forward history search respectively
# Reference https://unix.stackexchange.com/a/248789/278762
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# History
SAVEHIST=20000
HISTSIZE=25000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias c='clear'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lhA'
alias ls='ls --color'

# Optional Aliases
alias lc='colorls -A --sd'
alias llc='colorls -lA --sd'
command -v nvim >/dev/null 2>&1 && alias vim='nvim'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# User specific environment and startup programs
# example: conda initialize, other snippets
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
