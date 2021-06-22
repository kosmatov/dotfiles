alias dcrun="docker-compose run --rm"
alias dcdev="docker-compose -f docker-compose-dev.yml run"
alias rubocop="time dcrun -w /app console bundle exec rubocop -F $@"

function dc_project_dir() {
  [ -f 'docker-compose.yml' ] && echo '' || echo /$(basename $(pwd))
}

function vcr() {
  [ -n "$VCR" ] && echo " -e VCR_UP=1"
}

function rspec() {
  dcrun -w /app$(dc_project_dir) -e RACK_ENV=test -e APP_ENV=test $(vcr) console bundle exec rspec "$@"
}

function bundle() {
  dcrun -w /app$(dc_project_dir) -e RACK_ENV=test -e APP_ENV=test console bundle $@
}

function rcop() {
  base_branch=$(git rev-parse --verify --symbolic -q develop || echo -n master)
  rcop_files=$(git diff $base_branch..HEAD --name-only --diff-filter=dr | grep -E \*rb)
  rcop_script=$([ -n "$(dc_project_dir)" ] && echo ../. || echo .)rcop-script
  echo "#!/bin/bash\necho \"$rcop_files\" | xargs bundle exec rubocop $@" > $rcop_script
  chmod a+x $rcop_script
  time dcrun -w /app console ./.rcop-script
}


