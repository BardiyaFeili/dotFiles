# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load in Oh My Posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# For plugins
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval "$(fzf --zsh)"
autoload -Uz compinit && compinit
zinit cdreplay -q

# Env vars
export EDITOR='nvim'
export MANPAGER="sh -c 'col -bx | bat --paging=always -l man -p'"
export BAT_THEME="tokyonight_night"

# PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Fzf env vars
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :100 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --icons --color=always --git-ignore --group-directories-first  --level=2 {} | head -200'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=border:#27a1b9 \
  --color=bg:-1 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#27A1B9 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#27A1B9 \
  --color=spinner:#ff007c \
"

# For yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# KeyBindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^@' autosuggest-execute

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
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
zstyle ':fzf-tab:complete:*' fzf-preview 'eza --tree --color=always --icons --git-ignore --group-directories-first --level=2 $realpath'

# Aliases
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias pr='sudo pacman -R'
alias ps='pacman -Qs'
alias pv="pacman -Q"

alias yi='yay -S'
alias yu='yay -Syu'

alias fpi='flatpak install'
alias fpr='flatpak remove'
alias fpl='flatpak list'
alias fpu='flatpak update'

alias ls='eza --icons --color=always'
alias la='eza -a'
alias ll='eza -lh'
alias l='eza -l -a -h -b --no-user --no-permissions --no-time'
alias tree='eza --tree'
alias t='eza --tree --color=always --icons --level=2'

alias mk='mkdir'
alias md='mkdir'
alias rf='rm -rf'

alias b='bat --color=always'
alias bat='bat --color=always'

alias bu='bun'
alias p='pnpm'

alias cd='z'
alias f='fuck'
alias e='exit'
alias c='clear'
alias vs='code'
alias bt='btop'
alias s='source'
alias wh='which'
alias hi='hello'
alias ff='fastfetch'
alias a='aria2c -d ~/Downloads/aria2/'
alias fz="fzf --preview='bat --color=always {}'"

alias h='hyprctl'
alias hk='hyprctl kill'
alias hde='hyprctl dispatch exec'

alias g='rg'
alias grep='rg'

alias py='python3'
alias pipi='pip install'
alias v="source ./.venv/bin/activate"
alias venv="source ./.venv/bin/activate"

alias ca='cargo'
alias can='cargo new'
alias car='cargo run'
alias cai='cargo install'
alias rc='rustc'

alias mu='mullvad'
alias muc='mullvad connect'
alias mud='mullvad disconnect'

alias n='nvim'
alias vim='nvim'
alias nvi='nvim'
alias nivm='nvim'
alias nvmi='nvim'

alias sen='sudo systemctl enable'
alias son='sudo systemctl start'
alias sdi='sudo systemctl disable'
alias soff='sudo systemctl stop'
alias sre='sudo systemctl restart'

alias sshon='sudo systemctl enable sshd --now'
alias sshoff='sudo systemctl disable sshd --now'

alias st='~/Customization/themes/colloid/install.sh -c dark -l system --tweaks black rimless normal float && clear'

mkz () {
  mkdir $1
  z $1
}

zl () {
  z $1
  eza -a $cwd
}
