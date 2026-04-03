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

alias df="df -h -x tmpfs -x efivarfs | awk '!/^dev/'"
alias clean="sudo sync;sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"
