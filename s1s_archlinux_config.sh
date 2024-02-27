#!/bin/bash

CLONES_PATH=$HOME/Clones

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

echo "LANG=en_US.UTF-8" > /etc/locale.conf

sudo pacman -Syu


if [ -d "$CLONES_PATH" ]; then
    mkdir -p "$HOME/Clones"
fi

# install yay
git clone https://aur.archlinux.org/yay.git
cd "$HOME/Clones/yay/" && makepkg -si

cd "$HOME" && yay -Syu

sudo pacman -S make cmake automake gcc gdb llvm clang neovim composer rustup
sudo pacman -S ruby jre11-openhjdk jdk11-openjdk php nodejs julia
rustup toolchain install stable

sudo pacman -S unzip wget curl npm fish

# install kde plasma
sudo pacman -S xorg plasma plasma-wayland-session dolphin
systemctl enable NetworkManager.service
sudo pacman -S spectacle udiskie
# install and enable ly as display manager
sudo pacman -S ly
systemctl enable ly.service
# comment the line above and uncomment this line to set sddm as dm
# systemctl enable sddm.service

sudo pacman -S xclip wl-clipboard

# install fonts
sudo pacman -S noto-fonts noto-fonts-emoji adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts wqy-microhei wqy-microhei-lite ttf-hannom wqy-zenhei wqy-bitmapfont ttf-arphic-ukai ttf-arphic-uming noto-fonts-cjk opendesktop-fonts
sudo pacman -S otf-codenewroman-nerd ttf-iosevka-nerd ttf-dejavu-nerd ttf-noto-nerd ttf-jetbrains-mono-nerd hack-nerd-font


# install fcitx5
sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-configtool fcitx5-qt fcitx5-gtk fcitx5-material-color
cat>>"/etc/environment"<<EOF
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
INPUT_METHOD=fcitx
GLFW_IM_MODULE=ibus
EOF

# install hyprland
yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus
yay -S xdg-desktop-protal-hyprland
yay -S hyprland waybar ranger mako rofi alacritty swww feh grim slurp pamixer
yay -S microsoft-edge-stable-bin visual-studio-code-bin
