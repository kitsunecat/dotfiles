alias la='ls -la --color'
alias ll='ls -l --color'
alias home='cd ~'

alias dup='docker compose up'
alias ddown='docker compose down'
alias dr='docker compose run --rm'
alias dd='docker ps -aq -f "status=exited" | xargs docker rm -v; docker images -q -f "dangling=true" | xargs docker rmi; docker volume ls -qf dangling=true | xargs docker volume rm'
alias di='docker images'
alias dp='docker ps'

alias gl='git log --all --oneline --graph'
alias gs='git add -A; and git commit -am '
alias gc='git checkout '
alias gr='git fetch && git pull '

## Tsuk
alias td='docker compose -f compose.dev.yml'
alias td-run='docker compose -f compose.dev.yml run --rm app '

# ENV
set -x PATH $HOME/.rbenv/bin $HOME/.cargo/bin $HOME/.nodebrew/current/bin $PATH
set -x LDFLAGS "-L/usr/local/opt/mysql/lib"
set -x CPPFLAGS "-I/usr/local/opt/mysql/include"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
