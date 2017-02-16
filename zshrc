# enable emacs
set -o emacs

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit
zstyle ':completion:*' menu select=2

# load custom executable functions
for function in ~/.zsh/functions/*; do
    source $function
done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt histignoredups
setopt histappend
setopt inc_append_history
setopt share_history
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# use atom as the visual editor
export VISUAL='nvim'
export EDITOR=$VISUAL

# load thoughtbot/dotfiles scripts
export PATH="$HOME/bin:/usr/local/sbin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# add heroku cli
export PATH="$PATH:/usr/local/heroku/bin"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# aliases
source ~/.aliases

# load env variables with direnv
eval "$(direnv hook $0)"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

source /usr/local/share/zsh/site-functions/_aws

set_window_title() {
    echo -ne "\e]1;$(basename $1)\a"
}

set_window_git_title() {
    ref=$(git root 2> /dev/null)
    if [[ -n $ref ]]; then
        set_window_title $ref
    else
        set_window_title $(pwd)
    fi
}

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use

# autoload -U add-zsh-hook
# load-nvmrc() {
#     basedir=${$(git root 2> /dev/null):-$(pwd)}
#     if [[ -f "$basedir/.nvmrc" && -r "$basedir/.nvmrc" ]]; then
#       if [[ $(cat "$basedir/.nvmrc") != $(nvm version) ]]; then
#         nvm use
#       fi
#     fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

source ~/.iterm2_shell_integration.zsh
iterm2_print_user_vars() {
    basedir=${$(git root 2> /dev/null):-$(pwd)}
    iterm2_set_user_var project $(basename $basedir)
    iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load RVM
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
