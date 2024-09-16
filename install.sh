#!/bin/bash

rm ~/.gitconfig
cd ~/dotfiles && stow .

if ! command -v /usr/bin/yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git ./yay
  cd yay && makepkg -si --noconfirm
  cd .. && rm -rf yay
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo pacman -S zsh fastfetch kitty neovim yazi fzf bat eza zoxide git-delta thefuck btop tmux ttf-jetbrains-mono-nerd --noconfirm
yay -S oh-my-posh --noconfirm

case $1 in
hyprland)
  sudo pacman -S hyprland hyprlock hypridle hyprpaper xdg-desktop-portal-hyprland rofi-wayland dunst waybar copyq polkit-gnome --noconfirm
  yay -S hyprshot hyprpicker --noconfirm
  ;;
*)
  echo "First arg is wrong"
  ;;
esac
