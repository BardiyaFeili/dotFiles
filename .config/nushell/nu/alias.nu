alias pi = sudo pacman -S
alias pu = sudo pacman -Syu
alias pr = sudo pacman -R
alias ps = pacman -Qs
alias pv = pacman -Q

alias yi = yay -S
alias yu = yay -Syu
alias yr = yay -R

alias fpi = flatpak install
alias fpr = flatpak remove
alias fpl = flatpak list
alias fpu = flatpak update

alias la = ls -a
alias ll = ls -l
alias l = ls
alias t = tree

alias mk = mkdir
alias md = mkdir
alias rf = rm -rf

alias fz = fzf --preview='bat --theme=base16 --color=always {}'
alias ff = fastfetch
alias g = grep
alias b = bat --color=always --theme=base16
alias bat = bat --color=always --theme=base16
alias c = clear
alias vs = code
alias f = fuck
alias a = aria2c -d ~/Downloads/aria2/
alias p = pnpm
alias bu = bun
alias wh = which
alias cd = z
alias h = hyprctl
alias hi = hello
alias bt = btop
alias grep = rg

alias py = python3
alias pipi = pip install

alias ca = cargo
alias can = cargo new
alias car = cargo run
alias cai = cargo install
alias cac = rustc

alias mu = mullvad
alias muc = m ullvad connect
alias mud = mullvad disconnect

alias n = nvim
alias nvi = nvim
alias nivm = nvim
alias vim = nvim
alias nvmi = nvim

alias sen = sudo systemctl enable
alias son = sudo systemctl start
alias sdi = sudo systemctl disable
alias soff = sudo systemctl stop
alias sre = sudo systemctl restart

alias sshon = sudo systemctl enable sshd; sudo systemctl start sshd
alias sshoff = sudo systemctl disable sshd; sudo systemctl stop sshd

alias st = ~/Customization/themes/Colloid-gtk-theme-main/install.sh -c dark -l system --tweaks black rimless normal float; clear
