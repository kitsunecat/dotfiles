function fish_prompt
    # Gitブランチ情報を取得
    set git_branch (__fish_git_prompt | string join ' ')

    # プロンプトのカスタマイズ
    echo -n -e "\e[1;32m❯❯"
    if test -n "$git_branch"
        echo -n "$git_branch"
    end
    echo -n -e "\e[0m \e[1;34m$PWD\e[0m\n\e[1;32m❯\e[0m "
end
