# Work zsh configuration. This file intentionally contains the complete zsh
# setup so it does not depend on a separate ~/.config/zsh directory.

#############################################
# PATH and environment
#############################################

typeset -U path PATH

path=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.bun/bin"
    "$HOME/.fzf/bin"
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
    "/opt/nvim-linux-x86_64/bin"
    "/usr/local/bin"
    $path
)

export PATH
export POSH_THEMES_PATH="$HOME/.config/ohmyposh/themes"

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="vim"
    export VISUAL="vim"
else
    export EDITOR="nvim"
    export VISUAL="nvim"
fi

if command -v fd >/dev/null 2>&1; then
    FD_CMD="fd"
elif command -v fdfind >/dev/null 2>&1; then
    FD_CMD="fdfind"
fi

if [[ -n ${FD_CMD:-} ]]; then
    export FZF_DEFAULT_COMMAND="$FD_CMD --hidden --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

if command -v bat >/dev/null 2>&1; then
    BAT_CMD="bat"
elif command -v batcat >/dev/null 2>&1; then
    BAT_CMD="batcat"
fi

if [[ -n ${BAT_CMD:-} ]]; then
    export MANPAGER="sh -c \"col -bx | $BAT_CMD -l man -p\""
    export MANROFFOPT="-c"
fi

export FCEDIT="${EDITOR:-vi}"
export GREP_COLOR='mt=1;37;41'

#############################################
# Shell options and completion
#############################################

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

ZSH_COMPLETIONS_DIR="$HOME/.cache/antidote/github.com/zsh-users/zsh-completions/src"
if [[ -d "$ZSH_COMPLETIONS_DIR" ]]; then
    fpath=("$ZSH_COMPLETIONS_DIR" $fpath)
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '[%d]'

#############################################
# Optional Antidote plugins
#############################################

# Plugins remain optional: this block only loads them after Antidote has been
# installed separately. It never installs a plugin during shell startup.
zsh_plugins_source="${ZDOTDIR:-$HOME}/.zsh_plugins.txt"
zsh_plugins_cache="${zsh_plugins_source}.zsh"
if [[ -r "$HOME/.antidote/antidote.zsh" && -r "$zsh_plugins_source" ]]; then
    if [[ ! -s "$zsh_plugins_cache" || "$zsh_plugins_source" -nt "$zsh_plugins_cache" ]]; then
        source "$HOME/.antidote/antidote.zsh"
        antidote bundle < "$zsh_plugins_source" >| "$zsh_plugins_cache"
    fi

    [[ -r "$zsh_plugins_cache" ]] && source "$zsh_plugins_cache"
fi

#############################################
# Optional tool integrations
#############################################

if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

#############################################
# Aliases
#############################################

alias lg=lazygit

if command -v fdfind >/dev/null 2>&1; then
    alias fd='fdfind'
fi

if command -v batcat >/dev/null 2>&1; then
    alias bat='batcat'
fi

alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
alias grep='grep --color=always'
alias egrep='grep -E --color=always'
alias fgrep='grep -f --color=always'

#############################################
# Key bindings
#############################################

bindkey -v

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line
bindkey -M viins '^X^E' edit-command-line

# Sessionizer
bindkey -s '^f' 'sessionizer\n'
bindkey -s '\e1' 'tmux-sessionizer -s 0\n'
bindkey -s '\e2' 'tmux-sessionizer -s 1\n'
bindkey -s '\e3' 'tmux-sessionizer -s 2\n'
bindkey -s '\e4' 'tmux-sessionizer -s 3\n'

if (( $+widgets[history-substring-search-up] )); then
    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down
    bindkey -M emacs '^P' history-substring-search-up
    bindkey -M emacs '^N' history-substring-search-down
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

#############################################
# Prompt
#############################################

if command -v oh-my-posh >/dev/null 2>&1; then
    material_theme="${POSH_THEMES_PATH:-$HOME/.cache/oh-my-posh/themes}/material.omp.json"
    [[ -r "$material_theme" ]] && eval "$(oh-my-posh init zsh --config "$material_theme")"
fi
