PROMPT='%{$fg[blue]%}%n%{$reset_color%} on %{$fg[magenta]%}%M%{$reset_color%} in %{$fg[blue]%}%~%b%{$reset_color%}$(git_status_prompt)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"

# Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"

# Text to display if the branch is clean
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[cyan]%}"

function check_git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        GIT_BRANCH=$(git branch --show-current)
        [ -z "${GIT_BRANCH}" ] && GIT_BRANCH=$(git rev-parse --short HEAD)
        echo "(%{$fg[$(git_branch_color)]%}${GIT_BRANCH}%{$reset_color%})"
    fi
}

function git_branch_color() {
  if [ -n "$(git status --porcelain)" ]; then
    echo "red"
  else
    echo "green"
  fi
}
