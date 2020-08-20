# KDE
sudo pacman -S tlp && sudo systemctl enable tlp --now

sudo pacman -S xorg
sudo pacman -S plasma-desktop plasma-wayland-session sddm plasma-pa portaudio ntfs-3g util-linux
sudo pacman -S konsole dolphin kde-gtk-config kdeplasma-addons plasma-nm ark okular kinfocenter kwalletmanager gwenview spectacle kscreen kvantum-qt5 kwallet-pam ksystemlog khotkeys partitionmanager
sudo systemctl enable sddm.service

# Disable baloo crap
balooctl suspend && balooctl disable

# Setup ssd
sudo systemctl enable fstrim.timer

# Install yay
sudo pacman -S base-devel unzip
mkdir ~/Downloads && cd ~/Downloads
git clone https://aur.archlinux.org/yay.git && cd yay/ && makepkg -si

# Themeing
git clone https://github.com/vinceliuice/ChromeOS-kde.git && cd ChromeOS-kde && ./install.sh && ./sddm/install.sh && cd ..
git clone https://github.com/vinceliuice/ChromeOS-theme.git && cd ChromeOS-theme && ./install.sh && cd ..
git clone https://github.com/vinceliuice/Tela-icon-theme.git && cd Tela-icon-theme && ./install.sh && cd ..

# Swag
sudo pacman -S ansible
git clone https://github.com/EgorDm/dotfiles.git

ansible-playbook -i docker/hosts install.yml --tags "neovim,zsh,git,neofetch,rofi" --skip-tags="base,desktop"

# xmodmap
sudo pacman -S xorg-xmodmap
cp dotfiles/roles/xbindkeys/files/xmodmaprc ~/.Xmodmap

sudo pacman -S rofi
mkdir /home/egordm/.Xresources.d
cp dotfiles/roles/rofi/files/rofi ~/.Xresources.d/rofi
echo '#include ".Xresources.d/rofi"' >> ~/.Xresources
cp dotfiles/roles/i3-wm/files/colors ~/.Xresources.d/colors
echo '#include ".Xresources.d/colors"' >>  ~/.Xresources
xrdb ~/.Xresources
#  xinitrc make

# Further themeing
wget -O cabin.zip https://codeload.github.com/impallari/Cabin/zip/master && unzip cabin.zip && rm cabin.zip
sudo cp Cabin-master/fonts/TTF/*.ttf /usr/share/fonts/TTF

sudo rm /usr/share/sddm/themes/ChromeOS/background.jpg && sudo cp ~/dotfiles/wallpapers/1.jpg /usr/share/sddm/themes/ChromeOS/background.jpg

sudo pacman -S ttf-fira-code
