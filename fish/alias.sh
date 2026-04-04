# some alias
alias n=nvim
alias q=exit
alias c=clear
alias ls="eza --icons always"
alias os="fastfetch"
# cargo alias
alias cr="cargo run"
alias cb="cargo build"
alias crr="cargo run --release"
alias cbr="cargo build --release"
alias ct="cargo test"
alias cn="cargo new"
alias ci="cargo init"
# go alias
alias gr="go run"
alias gb="go build"
# git alias
alias gs="git status"
alias gp="git push"
alias gc="git commit"
alias ga="git add"
# tmux
alias tk="tmux kill-server"
alias tkp="tmux kill-pane"
alias tkw="tmux kill-window"
alias tks="tmux kill-session"
alias ta="tmux attach"
# quick cd
alias ,c="cd $HOME/.config"
alias ,cn="cd $HOME/.config/niri"
alias ,cx="cd $HOME/.config/xremap"
alias ,cf="cd $HOME/.config/fish"
alias ,s="cd $HOME/.config/scripts"
alias ,m="cd $HOME/Music"
alias ,dl="cd $HOME/Downloads"
alias ,dc="cd $HOME/Documents"
alias ,v="cd $HOME/Videos"
alias ,p="cd $HOME/Pictures"
alias ,h="cd $HOME"
# pacman
alias pu="paru -Syyu"
alias pR="paru -Rsn"
alias pr="paru -Ql"
alias po="paru -Qo"

alias df="df -h -x tmpfs -x efivarfs | awk '!/^dev/'"
alias clean="sudo sync;sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"
