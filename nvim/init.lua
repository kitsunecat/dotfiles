vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Ctrl+` でターミナルを開く/閉じる
vim.keymap.set('n', '<C-`>', ':split | terminal<CR>', { noremap = true, silent = true })
-- ターミナルモードからEscでノーマルモードに戻る
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

require("options")
require("keymaps")
require("plugins")
