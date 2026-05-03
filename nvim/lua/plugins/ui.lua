return {
  -- カラースキーム
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, _)
          hl.Whitespace = { fg = "#3b4261" }
          hl.NonText = { fg = "#3b4261" }
        end,
      })
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- ステータスライン
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { theme = "tokyonight" },
  },

  -- インデント可視化
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- which-key（キーバインドヘルプ）
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
