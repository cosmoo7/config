# Hist
HISTFILE=$HOME/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

# znap setup
[[ -r ~/.znap/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/znap
source ~/.znap/znap/znap.zsh

# znap plugins
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions

# Setup
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

prompt="%~ > "
# Bun stuff
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL/bin" ] && export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"

source $HOME/.aliasrc

# Source for eww autocomplete
source $HOME/.config/eww/autocomplete.sh

znap function dots_deploy(){
    current=$(pwd)
    dir=$HOME/dots
    [ -d !$dir ] && mkdir -pv $dir
    cd $dir; stow -v .; cd $current
}
