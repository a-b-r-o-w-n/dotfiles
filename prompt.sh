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

rbenv_ruby_version() {
  basedir=${$(git root 2> /dev/null):-$(pwd)}
  if [[ -f "$basedir/.ruby-version" && -r "$basedir/.ruby-version" ]]; then
    version=`rbenv version | sed -e 's/ .*//'`
    gemset=`rbenv gemset active 2> /dev/null | sed -e 's/ .*//'`

    if [[ -n $gemset ]]; then
      version="$version@$gemset"
    fi

    echo "[%{$fg[yellow]%}$version%{$reset_color%}]"
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
export PS1='[$TIMESTAMP] [%{$fg_bold[blue]%}%~%{$reset_color%}]$(git_prompt_info)'$'\n''$(rbenv_ruby_version) %{$fg[green]%}→%{$reset_color%} '
