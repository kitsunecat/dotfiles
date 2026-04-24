vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- leaderキーは他のキーマップを定義する前に設定する必要がある
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("keymaps")
require("autocmds")
require("plugins")
