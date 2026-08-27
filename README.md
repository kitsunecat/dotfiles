# シンボリックリンク

## zsh 設定

```sh
ln -s ~/dotfiles/_zshrc ~/.zshrc
```

## fish 設定

```sh
mv ~/.config/fish ~/.config/fish_bk
ln -s ~/dotfiles/fish ~/.config/fish
```

## for Linux

```sh
ln -s ~/dotfiles/_zshrc ~/.zshrc
mv ~/.config/fish ~/.config/fish_bk
ln -s ~/dotfiles/fish ~/.config/fish
ln -s ~/dotfiles/_wezterm.lua ~/.wezterm.lua
ln -s ~/dotfiles/nvim ~/.config/nvim
```
