# よくつかうエイリアス
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
alias vi='nvim'
alias vim='nvim'

## Tsuk
alias td-run='docker compose run --rm app '

# ENV
set -x PATH $HOME/.rbenv/bin $HOME/.cargo/bin $HOME/.nodebrew/current/bin $PATH

# mysql-client
set -x PATH /usr/local/opt/mysql-client/bin $PATH
set -x PATH /usr/local/opt/mysql-client/lib $PATH
set -x PATH /opt/homebrew/opt/mysql-client/bin $PATH

# openssl
set -x LDFLAGS "-L/opt/homebrew/opt/openssl@3/lib"
set -x CPPFLAGS "-I/opt/homebrew/opt/openssl@3/include"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# mise
mise activate fish | source

# ruby
if test -d ~/.rbenv
	set -x PATH $HOME/.rbenv/bin $PATH
  rbenv init - | source
end
