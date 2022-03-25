export SPACESHIP_TIME_SHOW=true

#if [ $IS_SSH ]; then
#  export SPACESHIP_PROMPT_DEFAULT_PREFIX='/ '
#else
#  export SPACESHIP_PROMPT_DEFAULT_PREFIX='❯ '
#fi

SPACESHIP_PROMPT_ORDER=(
  user
  host
  dir
  git
  node
  ruby
  docker
  exec_time
  line_sep
  vi_mode
  exit_code
  char
)
