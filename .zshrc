autoload -U compinit; compinit

ZSH_PLUGIN_CACHE_DIR="$HOME/.cache/zsh/plugins"
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

PLUGIN_LIST=(
    https://github.com/zsh-users/zsh-autosuggestions
    # make sure syntax highlighting is last
    https://github.com/zsh-users/zsh-syntax-highlighting
)

function InstallPlugin ()
{
    local plugin_repo=$1
    local plugin_name="$(echo "$plugin_repo" | awk -F '/' '{print $NF}')"
    local plugin_path="$ZSH_PLUGIN_CACHE_DIR/$plugin_name"
    
    if [ ! -d "$plugin_path" ]; then
        echo "installing $plugin_repo"
        git clone "$1" "$plugin_path"
    fi

    source "$ZSH_PLUGIN_CACHE_DIR/$plugin_name/$plugin_name.zsh"
}

function UpdatePlugins ()
{
    current_dir="$(pwd)"

    for plugin in $PLUGIN_LIST;
    do
        echo "updating $plugin:"
        local plugin_name="$(echo "$plugin" | awk -F '/' '{print $NF}')"
        local plugin_path="$ZSH_PLUGIN_CACHE_DIR/$plugin_name"
        cd $plugin_path
        git pull
    done

    cd $current_dir
    source ~/.zshrc
}


for plugin in $PLUGIN_LIST;
do
    InstallPlugin $plugin
done

source <(fzf --zsh)

alias ls='ls --color=auto'
alias vi='nvim'
alias hx='helix'
alias icat='kitty +kitten icat'
alias fullclear="printf '\E[H\E[3J'"
alias tabletdriver='systemctl --user start opentabletdriver.service --now'
alias brickbench='protontricks -c "/home/alex/Games/BrickBench/BrickBench.exe" 32440'
alias gamescope-display='gamescope -H 1440'

precmd() {print -rP $'%n@%m :\e[0;34m %~'}
PS1='$ '
