function fish_prompt
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showstagedstate 1
    set -g __fish_git_prompt_showuntrackedfiles 1
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_char_dirtystate '*'
    set -g __fish_git_prompt_char_stagedstate '+'
    set -g __fish_git_prompt_char_untrackedfiles '?'
    set -g __fish_git_prompt_char_cleanstate '✔'
    set -g __fish_git_prompt_color_dirtystate yellow
    set -g __fish_git_prompt_color_stagedstate green
    set -g __fish_git_prompt_color_untrackedfiles red
    set -g __fish_git_prompt_color_cleanstate brgreen

    set_color brblack
    echo -n (whoami)'@'(prompt_hostname)' '(prompt_pwd)
    set_color normal
    fish_vcs_prompt
    echo
    echo -n '> '
end
