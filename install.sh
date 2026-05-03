#!/usr/bin/sh

. ./scripts/lnk ./scripts/*
ln -sf $(realpath ./bash/bash_profile) /home/harunato/.bash_profile
ln -sf $(realpath ./bash/bashrc) /home/harunato/.bashrc
ln -sf $(realpath ./tmux/tumx.conf) /home/harunato/.tmux.conf

# config common lisp
curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
     --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
     --eval '(ql:add-to-init-file)' \
     --quit
sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit

# pacman hook
sudo mkdir -p /etc/pacman.d/hooks/
sudo cp ./hooks/pacman/* /etc/pacman.d/hooks/
