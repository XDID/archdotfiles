if status is-interactive
end

function fish_greeting
end

source $HOME/.config/fish/alias.sh

# config path
fish_add_path $HOME/Go/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin
fish_add_path $HOME/.cargo/bin

# config EDITOR
export EDITOR="/usr/sbin/nvim"
export GOPATH="$HOME/Go"
export TERMINAL="footclient"

zoxide init fish | source
starship init fish | source
fzf --fish | source
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/fzfrc"

# yazi cwd
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

set -x http_proxy http://127.0.0.1:7897
set -x https_proxy http://127.0.0.1:7897
# set -U fish_key_bindings fish_vi_key_bindings
