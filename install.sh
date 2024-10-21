#!/bin/env bash

rm ~/.gitconfig
cd ~/dotfiles && stow .

if ! command -v /usr/bin/paru &>/dev/null; then
  git clone https://aur.archlinux.org/paru.git ./paru
  cd paru && makepkg -si --noconfirm
  cd .. && rm -rf paru
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo pacman -S zsh fastfetch kitty neovim yazi fzf bat eza zoxide git-delta thefuck btop tmux ttf-jetbrains-mono-nerd --noconfirm
paru -S oh-my-posh-bin --noconfirm

case $1 in
hyprland)
  sudo pacman -S hyprland hyprlock hypridle hyprpaper xdg-desktop-portal-hyprland rofi-wayland dunst waybar polkit-gnome --noconfirm
  paru -S hyprshot hyprpicker clipse --noconfirm
  ;;
*)
  echo "First arg is wrong"
  ;;
esac
