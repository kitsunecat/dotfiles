if status is-interactive
    # Alias
    alias local-https='local-ssl-proxy --source 3443 --target '
    alias ecspush='aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin $ECS_PUSH_TARGET && docker tag $DOCKER_IMAGE_NAME:latest $ECS_PUSH_TARGET/$ECS_IMAGE_NAME:latest && docker push $ECS_PUSH_TARGET/$ECS_IMAGE_NAME:latest'

    alias la='ls -la --color'
    alias ll='ls -l --color'
    alias back='cd $OLDPWD'
    alias home='cd ~'
    alias ipv4='ifconfig | grep inet\ '
    alias ipv6='ifconfig | grep inet6'

    alias dup='docker compose up'
    alias ddown='docker compose down'
    alias dr='docker compose run --rm'
    alias dd='docker ps -aq -f "status=exited" | xargs docker rm -v; docker images -q -f "dangling=true" | xargs docker rmi; docker volume ls -qf dangling=true | xargs docker volume rm'
    alias di='docker images'
    alias dp='docker ps'
    alias sp='docker compose run --rm web bundle exec rspec'

    alias gl='git log --all --oneline --graph'
    alias gs='git add -A; and git commit -am '
    alias gc='git checkout '
    alias gr='git fetch && git pull '

    alias rspec='bundle exec rspec'
    alias rails='bundle exec rails'

    ## Tsuk
    alias td='docker compose -f compose.dev.yml'
    alias td-run='docker compose -f compose.dev.yml run --rm app '

    # ENV
    set -x PATH $HOME/.rbenv/bin $HOME/.cargo/bin $HOME/.nodebrew/current/bin $PATH
    set -x LDFLAGS "-L/usr/local/opt/mysql/lib"
    set -x CPPFLAGS "-I/usr/local/opt/mysql/include"

    function nvm_auto_use
        if test -e .node-version
            set node_version (cat .node-version | string trim)
            echo "Switching to Node.js version $node_version"
            nvm use $node_version
        end
    end
    nvm_auto_use

    # ディレクトリ移動時に自動実行
    function cd
        builtin cd $argv
        nvm_auto_use
    end
end
