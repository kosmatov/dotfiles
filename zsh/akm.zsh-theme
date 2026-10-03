PROMPT='%F{29}%M%f $(workdir_prompt)%f
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{22}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f)"

# Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_DIRTY=""

# Text to display if the branch is clean
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%F{28}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%F{172}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%F{28}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%F{31}"

function workdir_prompt() {
    local workdir=${(%):-%~}
    local GIT_BRANCH

    if git rev-parse --git-dir > /dev/null 2>&1; then
        GIT_BRANCH=$(git branch --show-current)
        [ -z "${GIT_BRANCH}" ] && GIT_BRANCH=$(git rev-parse --short HEAD)
        [[ $workdir == *"$GIT_BRANCH" ]] && workdir=${workdir%"$GIT_BRANCH"} || GIT_BRANCH=" $GIT_BRANCH"
        print -r -- "%F{31}${workdir}%b%f%F{$(git_branch_color)}${GIT_BRANCH}"
        return
    fi

    print -r -- "%F{blue}${workdir}%b"
}

function git_branch_color() {
  if [ -n "$(git status --porcelain)" ]; then
    echo "166"
  else
    echo "70"
  fi
}
