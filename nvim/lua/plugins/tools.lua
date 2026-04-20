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
  -- PR閲覧関連
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>gho", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "PR diff (vs main)" },
      { "<leader>ghd", "<cmd>DiffviewOpen<cr>",                    desc = "Diff working tree" },
      { "<leader>ghx", "<cmd>DiffviewClose<cr>",                   desc = "Close diffview" },
      { "<leader>ghh", "<cmd>DiffviewFileHistory %<cr>",           desc = "File history (current)" },
      { "<leader>ghH", "<cmd>DiffviewFileHistory<cr>",             desc = "File history (repo)" },
      { "<leader>ght", "<cmd>DiffviewToggleFiles<cr>",             desc = "Toggle files panel" },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    keys = {
      { "<leader>ghp", "<cmd>Octo pr list<cr>",       desc = "PR list" },
      { "<leader>ghP", "<cmd>Octo pr checkout<cr>",   desc = "PR checkout" },
      { "<leader>ghi", "<cmd>Octo issue list<cr>",    desc = "Issue list" },
      { "<leader>ghr", "<cmd>Octo review start<cr>",  desc = "Review start" },
      { "<leader>ghs", "<cmd>Octo review submit<cr>", desc = "Review submit" },
    },
    config = true,
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
