alias dcrun="docker-compose run"
alias dcdev="docker-compose -f docker-compose-dev.yml run"
alias rubocop="dcrun -w /app console bundle exec rubocop -F $@"

function dc_project_dir() {
  [ -f 'docker-compose.yml' ] && echo '' || echo /$(basename $(pwd))
}

function vcr_env() {
  [ -n "$VCR$VCR_UP" ] && echo " -e VCR_UP=1"
}

function rspec() {
  dcrun -w /app$(dc_project_dir) -e APP_ENV=test -e RACK_ENV=test $(vcr_env) console bundle exec rspec "$@"
}

function bundle() {
  if [ "$1" = "all" ]; then
    bundle_script=$([ -n "$(dc_project_dir)" ] && echo ../. || echo .)bundle-script

    echo "#!/bin/bash

    find ./ -maxdepth 2 -name Gemfile | {
      while read str; do
        dir=\$(dirname \$str)
        cd \$dir && echo -\\>\$(pwd) && bundle && [ \$dir = '.' ] || cd .. && echo \$(pwd)
      done
    }" > $bundle_script
    
    chmod a+x $bundle_script
    dcrun -w /app console ./.bundle-script
  else
    dcrun -w /app$(dc_project_dir) -e APP_ENV=test -e RACK_ENV=test console bundle $@
  fi
}

function rcop() {
  base_branch=$(git rev-parse --verify --symbolic -q develop || echo -n master)
  rcop_files=$(git diff $base_branch..HEAD --name-only --diff-filter=dr | grep -E \*rb)
  rcop_script=$([ -n "$(dc_project_dir)" ] && echo ../. || echo .)rcop-script
  echo "#!/bin/bash\necho \"$rcop_files\" | xargs bundle exec rubocop $@" > $rcop_script
  chmod a+x $rcop_script
  dcrun -w /app console ./.rcop-script
}

function iex() {
  dcrun -w /app$(dc_project_dir) console iex "$@"
}

function elixirc() {
  dcrun -w /app$(dc_project_dir) console elixirc "$@"
}
  
function elixir() {
  dcrun -w /app$(dc_project_dir) console elixir "$@"
}

function mix() {
  dcrun -w /app$(dc_project_dir) console mix "$@"
}
