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

# git alias
alias gs="git status"
alias gP="git push"
alias gp="git pull"
alias gf="git fetch"
alias gc="git commit -m"
alias ga="git add"
alias gb="git branch"
alias gbd="git branch -d"
alias gbm="git branch -m"
alias gcb="git checkout -b"
alias gr="git restore"
alias gd="git diff"
alias gm="git merge"
alias gl="git log"
alias gst="git stash save"
alias gsd="git stash drop"
alias gsp="git stash pop"
alias gsa="git stash apply"
alias gsl="git stash list"

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
alias ,dv="cd $HOME/Development"
alias ,v="cd $HOME/Videos"
alias ,p="cd $HOME/Pictures"
alias ,g="cd $HOME/Game"
alias ,h="cd $HOME"
alias ,="cd $HOME"

# pacman
alias pu="sudo pacman -Syyu"
alias pR="sudo pacman -Rsn"
alias pql="sudo pacman -Ql"
alias pqo="sudo pacman -Qo"
alias pqi="sudo pacman -Qi"
alias pqs="sudo pacman -Qs"
alias pi="sudo pacman -S"
alias psi="sudo pacman -Si"
alias pss="sudo pacman -Ss"
alias pru="paru -Syyu"
alias prR="paru -Rsn"
alias prql="paru -Ql"
alias prqo="paru -Qo"
alias prqi="paru -Qi"
alias prqs="paru -Qs"
alias pri="paru -S"
alias prsi="paru -Si"
alias prss="paru -Ss"

# umu
alias ur="WINEPREFIX=~/.wine PROTONPATH=/home/harunato/.local/share/Steam/compatibilitytools.d/GE-Proton10-34 gamescope -f -W 3840 -H 2160 -r 60 --force-grab-cursor -- umu-run"

alias s="systemctl"
alias ss="sudo systemctl"

alias cal="calcurse"

alias df="df -h -x tmpfs -x efivarfs | awk '!/^dev/' | sort"
alias free="free -h"
alias clean="sudo sync;sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"
