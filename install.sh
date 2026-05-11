#!/usr/bin/sh

confirm() {
    read -rp "$1 [y/N] " choice
    [[ "$choice" =~ ^[Yy]$ ]]
}

. ./scripts/lnk ./scripts/*
ln -sf $(realpath ./bash/bash_profile) /home/harunato/.bash_profile
ln -sf $(realpath ./bash/bashrc) /home/harunato/.bashrc
ln -sf $(realpath ./tmux/tumx.conf) /home/harunato/.tmux.conf

# config common lisp
if confirm "install common lisp"; then
    echo 1
    curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
    sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
         --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
         --eval '(ql:add-to-init-file)' \
         --quit
    sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit
fi

# pacman hook
sudo mkdir -p /etc/pacman.d/hooks/
sudo cp ./hooks/pacman/* /etc/pacman.d/hooks/
