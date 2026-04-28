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
      auto_reload_on_write = true,
      reload_on_bufenter = true,
      filesystem_watchers = {
        enable = true, -- 外部からのファイル変更を検知して自動更新
        debounce_delay = 50,
      },
    },
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        map("n", "]c", function() gs.nav_hunk("next") end, "Next Hunk")
        map("n", "[c", function() gs.nav_hunk("prev") end, "Prev Hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>hb", gs.blame_line, "Blame Line")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit" },
    keys = {
      { "<leader>gd", "<cmd>Gdiffsplit<cr>",      desc = "Diff vs HEAD" },
      { "<leader>gD", "<cmd>Gdiffsplit main<cr>", desc = "Diff vs main" },
      { "<leader>gs", "<cmd>Git<cr>",             desc = "Git status" },
      { "<leader>gb", "<cmd>Git blame<cr>",       desc = "Git blame" },
    },
  },
  -- PR閲覧関連
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gv",   "<cmd>DiffviewOpen<cr>",                       desc = "Diffview open" },
      { "<leader>gV",   "<cmd>DiffviewClose<cr>",                      desc = "Diffview close" },
      { "<leader>ghod", "<cmd>DiffviewOpen origin/develop...HEAD<cr>", desc = "PR diff (vs develop)" },
      { "<leader>ghom", "<cmd>DiffviewOpen origin/main...HEAD<cr>",    desc = "PR diff (vs main)" },
      { "<leader>ghd",  "<cmd>DiffviewOpen<cr>",                       desc = "Diff working tree" },
      { "<leader>ghx",  "<cmd>DiffviewClose<cr>",                      desc = "Close diffview" },
      { "<leader>ghh",  "<cmd>DiffviewFileHistory %<cr>",              desc = "File history (current)" },
      { "<leader>ghH",  "<cmd>DiffviewFileHistory<cr>",                desc = "File history (repo)" },
      { "<leader>ght",  "<cmd>DiffviewToggleFiles<cr>",                desc = "Toggle files panel" },
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
      { "<leader>ghr", "<cmd>Octo review start<cr>",   desc = "Review start" },
      { "<leader>ghR", "<cmd>Octo review resume<cr>",  desc = "Review resume" },
      { "<leader>ghD", "<cmd>Octo review discard<cr>", desc = "Review discard" },
      { "<leader>ghs", "<cmd>Octo review submit<cr>",  desc = "Review submit" },
      { "<leader>ghf", "<cmd>Octo pr changes<cr>", desc = "PR changed files (picker)" },
    },
    config = true,
  },

  -- Markdownプレビュー (glow)
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    ft = { "markdown" },
    opts = {},
    keys = {
      { "<leader>mp", "<cmd>Glow<cr>", desc = "Markdown preview (glow)", ft = "markdown" },
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
