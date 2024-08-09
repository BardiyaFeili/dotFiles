# My dotFiles, you can get using GNU Stow

## Getting the dots

First get the packages required to get the dots

```bash
sudo pacman -S stow git

git clone https://github.com/BardiyaFeili/dotfiles.git ~/dotfiles

cd ~/dotfiles

stow .
```

## Installing all the programs

Now we need to donwload all the packages

### Packages for terminal

```bash
sudo pacman -S zsh fastfetch kitty neovim  yazi fzf bat eza zoxide git-delta thefuck btop ttf-jetbrains-mono-nerd 
```

```bash
yay -S oh-my-posh
```

### Packages for hyprland

```bash
sudo pacman -S hyprland hyprlock hypridle hyprpaper xdg-desktop-portal-hyprland rofi-wayland dunst waybar copyq polkit-gnome
```

```bash
yay -S hyprshot hyprpicker
```

It should be done now

#### Other Packages you would want

```bash
sudo pacman -S hello sl zed firefox
```

```bash
yay -S visual-studio-code-bin mullvad-bin
```
