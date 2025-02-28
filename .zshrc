# Hist
HISTFILE=$HOME/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

# Setup
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

PS1="%~ > "
# Bun stuff
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL/bin" ] && export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"

source $HOME/.aliasrc

function dots_deploy(){
    current=$(pwd)
    dir=$HOME/dots
    [ -d !$dir ] && mkdir -pv $dir
    cd $dir; stow -v .; cd $current
}
