export DOTFILES_HOME=$HOME/dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump docker-compose k zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# use nvim as the visual editor
export VISUAL='code -w'
export EDITOR=$VISUAL

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin:$DOTFILES_HOME/bin"

# aliases
source ~/dotfiles/aliases

# load env variables with direnv
command -v direnv &>/dev/null && eval "$(direnv hook $SHELL)"

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

command -v rbenv &>/dev/null && eval "$(rbenv init -)"

if command -v fnm > /dev/null 2>&1; then
  eval "`fnm env --use-on-cd`"
fi

# configure spaceship
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_VI_MODE_SHOW=false
export SPACESHIP_BATTERY_SHOW=false
export SPACESHIP_EXEC_TIME_SHOW=false
export SPACESHIP_KUBECONTEXT_SHOW=false
export SPACESHIP_EMBER_SHOW=false
export SPACESHIP_DOTNET_SHOW=false
export SPACESHIP_PYENV_SHOW=false
export SPACESHIP_CONDA_SHOW=false
export SPACESHIP_VENV_SHOW=false
export SPACESHIP_AWS_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_JULIA_SHOW=false
export SPACESHIP_HASKELL_SHOW=false
export SPACESHIP_RUST_SHOW=false
export SPACESHIP_PHP_SHOW=false
export SPACESHIP_GOLANG_SHOW=false
export SPACESHIP_SWIFT_SHOW_LOCAL=false
export SPACESHIP_XCODE_SHOW_LOCAL=false
export SPACESHIP_ELIXIR_SHOW=false
export SPACESHIP_PACKAGE_SHOW=false

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# history
HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g') # only for OSX
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook

# integration with zsh-autosuggest
_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here

# reverse search
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/histdb-interactive.zsh
bindkey '^r' _histdb-isearch

fpath+=$DOTFILES_HOME/zsh/completion
fpath=( $DOTFILES_HOME/zfunc "${fpath[@]}" )

_git 2>/dev/null

autoload -Uz glolf
compdef _git glolf=git-log

autoload -Uz gbf
compdef _git gbf=git-branch
