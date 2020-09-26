function SetProxy {
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
}

function UnsetProxy {
    unset http_proxy
    unset https_proxy
}

alias em="emacs -nw"
