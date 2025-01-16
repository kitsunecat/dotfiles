# homebrew
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

# MySQL
set -x PATH /usr/local/opt/mysql/bin $PATH
set -x LDFLAGS "-L/usr/local/opt/mysql/lib"
set -x CPPFLAGS "-I/usr/local/opt/mysql/include"

# Node.js（nodebrew 経由）
set -x PATH $HOME/.nodebrew/current/bin $PATH

# rbenv設定
set -Ux RBENV_ROOT $HOME/.rbenv
set -U fish_user_paths $RBENV_ROOT/bin $fish_user_paths

# rbenv init
status is-interactive; and source (rbenv init -|psub)

# Rust
set -x PATH $HOME/.cargo/bin $PATH

# hping3
set -x PATH /usr/local/sbin $PATH

# その他の独自スクリプト
set -x PATH $HOME/dotfiles/shfiles $PATH
