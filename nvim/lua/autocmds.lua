-- フォーカスが戻ったとき、バッファを切り替えたときなどに checktime を実行
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
})

-- 外部でファイルが変更されたら通知
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("ファイルが外部で変更されたため再読み込みしました", vim.log.levels.INFO)
  end,
})
