alias dcrun="docker-compose run"
alias rubocop="dexec_console rubocop $@"
alias iex="dexec_console iex $@"
alias elixirc="dexec_console elixirc $@"
alias elixir="dexec_console elixir $@"
alias mix="dexec_console mix $@"
alias cargo="dexec_console cargo $@"
alias pio="dexec_console pio $@"

function dc_console_container() {
  docker-compose ps -a | grep console | grep running | cut -d' ' -f1
}

function dexec_console() {
  project_dir=$(dc_project_dir)
  [ -n "$(dc_console_container)" ] || docker-compose run -d console tail -F none
  (cd $(dc_workdir) && docker exec -i -w /app$project_dir $(echo $DEXEC_ARGV) $(dc_console_container) $@ && exit 1)
}

function dc_workdir() {
  [ -n "$(dc_project_dir)" ] && echo '..' || echo '.'
}

function dc_project_dir() {
  [ -f 'docker-compose.yml' ] && echo '' || echo /$(basename $(pwd))
}

function vcr_env() {
  [ -n "$VCR$VCR_UP" ] && echo "-e VCR_UP=1 "
}

function prof_env() {
  [ -n "$PROF" ] && echo "-e TEST_STACK_PROF=$PROF -e TEST_STACK_PROF_FORMAT=json "
}

function log_env() {
  [ -n "$LOG" ] && echo "-e LOG=$LOG "
}

function rspec() {
  project_dir=$(dc_project_dir)
  [ -n "$(dc_console_container)" ] || docker-compose run -d console tail -F none
  (cd $(dc_workdir) && docker exec -ti -w /app$project_dir -e APP_ENV=test -e RACK_ENV=test $(log_env)$(prof_env)$(vcr_env)$(dc_console_container) bundle exec rspec "$@")
}

function psql() {
  docker exec -ti $(docker-compose ps | grep postgres | head -1 | cut -d' ' -f1) psql $@
}

function bundle() {
  if [ "$1" = "all" ]; then
    echo "#!/bin/bash

    find ./ -maxdepth 2 -name Gemfile | {
      while read str; do
        dir=\$(dirname \$str)
        cd \$dir && echo -\\>\$(pwd) && bundle && [ \$dir = '.' ] || cd .. && echo \$(pwd)
      done
    }" > $(dc_workdir)/.bundle-script

    chmod a+x $(dc_workdir)/.bundle-script
    (cd $(dc_workdir) && dexec_console ./.bundle-script)
  else
    DEXEC_ARGV="-e APP_ENV=test -e RACK_ENV=test" dexec_console bundle $@
  fi
}

function rcop() {
  base_branch=$(git rev-parse --verify --symbolic -q develop || echo -n master)
  rcop_files=$(git diff origin/$base_branch..HEAD --name-only --diff-filter=dr | grep -E "*\.rb")
  workdir=$(dc_workdir)
  echo "#!/bin/bash\necho \"$rcop_files\" | xargs bundle exec rubocop $@" > $workdir/.rcop-script
  chmod a+x $workdir/.rcop-script
  (cd $workdir && dexec_console ./.rcop-script)
}
