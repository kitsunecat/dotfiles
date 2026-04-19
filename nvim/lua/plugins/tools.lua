return {
  -- ファジーファインダー
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",           desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",            desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",              desc = "Buffers" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>",          desc = "Diagnostics" },
    },
    opts = {},
  },

  -- ファイルツリー
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Tree" },
    },
    opts = {
      hijack_directories = {
        enable = true, -- ディレクトリを開いたときにnvim-treeを起動
        auto_open = true,
      },
      update_focused_file = {
        enable = true, -- 開いているファイルをツリーでハイライト
      },
    },
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        map("n", "]c", gs.next_hunk, "Next Hunk")
        map("n", "[c", gs.prev_hunk, "Prev Hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>hb", gs.blame_line, "Blame Line")
      end,
    },
  },

  -- エラー一覧
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
    },
    opts = {},
  },
}
