local map = vim.keymap.set

-- 基本操作
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- ターミナル
map("n", "<C-`>", ":split | terminal<CR>", { noremap = true, silent = true })
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- ウィンドウ分割
map("n", "<C-w>|", "<cmd>vsplit<cr>")
map("n", "<C-w>-", "<cmd>split<cr>")

-- ウィンドウ移動（Ctrl+hjkl）
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- ターミナルモードからウィンドウ移動（ESCを使わずClaudeの会話を中断しない）
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- ウィンドウリサイズ（Ctrl+矢印キー）
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")

-- バッファ
map("n", "<S-l>", "<cmd>bnext<cr>")
map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<leader>bd", "<cmd>bdelete<cr>")

-- インデントをビジュアルモードで連続して使う
map("v", "<", "<gv")
map("v", ">", ">gv")

-- ファイル操作
map("n", "<leader>fy", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy relative path" })

map("n", "<leader>fu", function()
  local file_dir = vim.fn.expand("%:p:h")
  local function git(cmd)
    return vim.fn.system("git -C " .. vim.fn.shellescape(file_dir) .. " " .. cmd):gsub("\n", "")
  end
  local remote = git("remote get-url origin")
  if vim.v.shell_error ~= 0 then
    vim.notify("Not a git repository", vim.log.levels.ERROR)
    return
  end
  remote = remote:gsub("git@github%.com:", "https://github.com/")
  remote = remote:gsub("%.git$", "")
  local branch = git("branch --show-current")
  local git_root = git("rev-parse --show-toplevel")
  local abs_path = vim.fn.expand("%:p")
  local rel_path = abs_path:sub(#git_root + 2)
  local url = remote .. "/blob/" .. branch .. "/" .. rel_path
  vim.fn.setreg("+", url)
  vim.notify("Copied: " .. url)
end, { desc = "Copy GitHub URL" })

map("n", "<leader>fx", function()
  local path = vim.fn.expand("%:p")
  local name = vim.fn.expand("%:t")
  vim.ui.input({ prompt = "Delete " .. name .. "? (y/N): " }, function(input)
    if input == "y" or input == "Y" then
      vim.fn.delete(path)
      vim.cmd("bdelete!")
      vim.notify("Deleted: " .. name)
    end
  end)
end, { desc = "Delete file" })
