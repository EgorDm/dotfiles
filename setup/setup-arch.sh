# File config
lsblk
mkfs.ext4 $MAIN_PART
mkfs.swapfs $SWAP_PART
mkfs.fat -F32 $BOOT_PART
swapon $SWAP_PART
mount $MAIN_PART /mnt

# Mirrorlist
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "NL" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

# Arch setup
pacstrap /mnt base linux linux-firmware neovim
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# Clock
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
hwclock --systohc

# Langueage
nvim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 /etc/locale.conf
export LANG=en_US.UTF-8

# Network
echo megatron > /etc/hostname 
cat << EOF
127.0.0.1 locahost
::1   localhost
127.0.1.1 megatron
EOF >> /etc/hosts

cat << EOF
nameserver 1.1.1.1
nameserver 1.0.0.1
EOF >> /etc/resolv.conf

passwd

# Boot Manager
pacman -S grub efibootmgr
mkdir /boot/efi && mount $BOOT_PART /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

# Utils / Network
pacman -S networkmanager networkmanager-openvpn git sudo
systemctl enable NetworkManager.service

# User
useradd -m egordm
passwd egordm
EDITOR=nvim visudo
# egordm ALL=(ALL) ALL
# %sudo ALL=(ALL) ALL

reboot
