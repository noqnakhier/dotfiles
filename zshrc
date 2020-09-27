function SetProxy {
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
}

function UnsetProxy {
    unset http_proxy
    unset https_proxy
}

export GOPATH=~/Dev/projects/go
export GOBIN=~/Dev/gobin
export GO111MODULE=on

export PATH=/usr/local/sbin:/usr/local/opt/openssl@1.1/bin:$GOBIN:~/.emacs.d/bin:$PATH

alias vim='nvim'
alias vi='nvim'
alias nv='nvim'
alias em='emacs -nw'

# Rust Programming Language
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
