# syntax = docker/dockerfile:experimental
FROM archlinux:latest

# Archlinux Deps
RUN pacman -Syu --noconfirm \ 
      sudo \
      binutils \
      util-linux \
      fakeroot \
      file \
      python \
      make \
      gcc \
      pkg-config \
      which \
      perl \
      automake \
      autoconf \
      gettext \
      patch

# Project deps
RUN pacman -S --noconfirm \ 
      ansible \
      git

# Fix tmp dir perms
RUN chmod 1777 /tmp

# Create user
ARG CFG_USER=egordm
ARG CFG_PASS=egordm

RUN useradd -m $CFG_USER \
 && chown -R $CFG_USER:$CFG_USER /home/$CFG_USER \
 && echo -e "$CFG_PASS\n$CFG_PASS" | passwd $CFG_USER \
 && echo "$CFG_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $CFG_USER
WORKDIR /home/$CFG_USER/

# Configure lunix
RUN mkdir dotfiles
COPY . dotfiles
VOLUME /home/$CFG_USER/dotfiles

ARG CFG_HOST=desktop

RUN --mount=type=cache,target=/var/cache/pacman/pkg \
  --mount=type=cache,target=/home/$CFG_USER/.cache/yay \
  cd dotfiles; ansible-playbook -i docker/hosts install.yml | tee ansible.log
RUN echo -e "$CFG_PASS" | chsh -s '/usr/bin/zsh'

ENTRYPOINT /usr/bin/zsh
