# My dotFiles, you can get using GNU Stow

## Getting the dots

### First get the packages required to get the dots

```bash
sudo pacman -S stow git github-cli
```

### Login into github

```bash
gh auth Login
```

### Get the dots on your PC

```bash
git clone https://github.com/BardiyaFeili/dotfiles.git ~/dotfiles
```

> [!TIP]
> You can do the rest of the installation with the install script

```bash
cd ~/dotfiles

stow .
```

## Installing all the programs

### Other things that you need

#### Install Paru

```bash
  git clone https://aur.archlinux.org/paru.git ./paru
  cd paru && makepkg -si --noconfirm
  cd .. && rm -rf paru
```

#### Install TPM for Tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Packages for the terminal

```bash
sudo pacman -S zsh fastfetch kitty neovim  yazi fzf bat eza zoxide git-delta thefuck btop tmux ttf-jetbrains-mono-nerd
```

```bash
paru -S oh-my-posh-bin
```

### Packages for Hyprland

```bash
sudo pacman -S hyprland hyprlock hypridle hyprpaper xdg-desktop-portal-hyprland rofi-wayland dunst waybar polkit-gnome
```

```bash
paru -S hyprshot hyprpicker clipse
```

### Other Packages you would want

```bash
sudo pacman -S hello sl zed firefox
```

```bash
paru -S visual-studio-code-bin mullvad-vpn-bin zen-browser-bin ventoy-bin vesktop-bin spotify spicetify-cli
```
