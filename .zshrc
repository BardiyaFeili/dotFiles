# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

#Load in OMP and pywal
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

if [ -d "$HOME/.cache/wal" ]; then
 #  cat "$HOME/.cache/wal/sequences"  &
    clear
fi

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

#For plugins
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval "$(fzf --zsh)"
autoload -Uz compinit && compinit
zinit cdreplay -q
eval "$(register-python-argcomplete pipx)"
export FZF_CTRL_T_OPTS="--preview 'bat -n --theme=base16 --color=always --line-range :100 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --icons --color=always --git-ignore --group-directories-first  --level=2 {} | head -200'"
export EDITOR='nvim'
export HOME="/home/bardiya" export 
export HYPRSHOT_DIR=$HOME/Pictures/Screenshots/
export PATH="$HOME/.cargo/bin:$PATH"
export BAT_THEME="base16"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#KeyBindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

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

#Aliases
alias pi='sudo pacman -S'
alias pu='sudo pacman -Syu'
alias pr='sudo pacman -R'
alias ps='pacman -Qs'
alias pv="pacman -Q"

alias yi='yay -S'
alias yu='yay -Syu'
alias yr='yay -R'

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
alias fz="fzf --preview='bat --theme=base16 --color=always {}'"
alias ff='fastfetch'
alias g='grep'
alias b='bat --color=always --theme=base16'
alias bat='bat --color=always --theme=base16'
alias c='clear'
alias vs='code'
alias s='source'
alias f='fuck'
alias a='aria2c -d ~/Downloads/aria2/'
alias p='pnpm'
alias bu='bun'
alias wh='which'
alias cd='z'
alias h='hyprctl'
alias hi='hello'
alias bt='btop'

alias py='python3'
alias pipi='pip install'
alias v="source ./.venv/bin/activate"
alias venv="source ./.venv/bin/activate"

alias ca='cargo'
alias car='cargo run'
alias cai='cargo install'
alias cr='rustc'

alias mu='mullvad'
alias muc='mullvad connect'
alias mud='mullvad disconnect'

alias n='nvim'
alias nvi='nvim'
alias nivm='nvim'

alias sen='systemctl enable'
alias son='systemctl start'
alias sdi='systemctl disable'
alias soff-'systemctl stop'

alias sshon='systemctl enable sshd && systemctl start sshd'
alias sshoff='systemctl disable sshd && systemctl stop sshd'

alias pw='yy ~/Pictures/Wallpapers/ && cd ~'
alias sw='~/Code/Scripts/wpset.sh -w'
alias st='~/Customization/themes/Colloid-gtk-theme-main/install.sh -c dark -l system --tweaks black rimless normal float && clear'

# Created by `pipx` on 2024-08-16 14:32:20
export PATH="$PATH:/home/bardiya/.local/bin"
