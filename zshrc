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

# use vim as the visual editor
export VISUAL='nvim'
export EDITOR=$VISUAL

# load thoughtbot/dotfiles scripts
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/bin:$PATH"

# mkdir .git/safe in the root of repositories you trust
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# add heroku cli
export PATH="$PATH:/usr/local/heroku/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# aliases
source ~/.aliases

# load env variables with direnv
eval "$(direnv hook $0)"

# Prompt
GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="𐌣"
ZSH_THEME_GIT_PROMPT_BEHIND="ↆ"
ZSH_THEME_GIT_PROMPT_CURRENT="="

parse_git_branch() {
    (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

parse_git_dirty() {
    if command git diff-index --quiet HEAD 2> /dev/null; then
        echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    else
        echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
    fi
}

# show current rvm version
# rvm_ruby_version() {
#   if [[ -f ".ruby-version" ]]; then
#     echo "[%{$fg_bold[yellow]%}$(~/.rvm/bin/rvm-prompt)%{$reset_color%}]"
#   fi
# }

# show current nvm version
# nvm_node_version() {
#   if [[ -f ".nvmrc" ]]; then
#     echo "found nvmrc"
#     echo "[%{$fg_bold[yellow]%}node-$(nvm version)%{$reset_color%}]"
#   fi
# }

show_upstream() {
    upstream_state=''
    current=true
    ahead_count=$(git rev-list @{upstream}.. --count 2> /dev/null)
    if [ $ahead_count ] && (( $ahead_count > 0 )); then
        upstream_state="%{$fg[yellow]%}$ZSH_THEME_GIT_PROMPT_AHEAD${ahead_count}%{$reset_color%}"
        current=false
    fi

    behind_count=$(git rev-list HEAD..@{upstream} --count 2> /dev/null)
    if [ $behind_count ] && (( $behind_count > 0 )); then
        upstream_state="$upstream_state %{$fg[yellow]%}$ZSH_THEME_GIT_PROMPT_BEHIND${behind_count}%{$reset_color%}"
        current=false
    fi

    if $current; then
        upstream_state="%{$fg[green]%}$ZSH_THEME_GIT_PROMPT_CURRENT%{$reset_color%}"
    fi

    echo $upstream_state
}

# adds the current branch name in green
git_prompt_info() {
    set_window_git_title
    ref=$(git symbolic-ref HEAD 2> /dev/null)
    if [[ -n $ref ]]; then
        echo " [%{$fg_bold[magenta]%}${ref#refs/heads/}%{$reset_color%} $(parse_git_dirty) $(show_upstream)]"
    fi
}

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt PROMPT_SUBST

TIMESTAMP="%{$fg[green]%}%D{%L:%M:%S %p}%{$reset_color%}"

# prompt
export PS1='[$TIMESTAMP] [%{$fg_bold[blue]%}%~%{$reset_color%}]$(git_prompt_info)'$'\n''%{$fg[green]%}→%{$reset_color%} '

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
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# TODO: figure out how to not break things with this
# nvm() {
#     unset -f nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     nvm "$@"
# }

# node() {
#     unset -f node
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     node "$@"
# }

# npm() {
#     unset -f npm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     npm "$@"
# }

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
