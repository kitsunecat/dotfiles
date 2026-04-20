return {
  -- LSPサーバー管理（インストールのみ、設定はvim.lsp.configで）
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "ruby_lsp",
        "ts_ls",
        "rust_analyzer",
        "lua_ls",
      },
    },
  },

  -- nvim-lspconfig（0.11では設定の橋渡しのみに使う）
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        map("gd",          vim.lsp.buf.definition,    "Go to Definition")
        map("gD",          vim.lsp.buf.declaration,   "Go to Declaration")
        map("gr",          vim.lsp.buf.references,    "References")
        map("K",           vim.lsp.buf.hover,         "Hover Doc")
        map("<leader>rn",  vim.lsp.buf.rename,        "Rename")
        map("<leader>ca",  vim.lsp.buf.code_action,   "Code Action")
        map("<leader>d",   vim.diagnostic.open_float, "Show Diagnostic")
        map("[d",          vim.diagnostic.goto_prev,  "Prev Diagnostic")
        map("]d",          vim.diagnostic.goto_next,  "Next Diagnostic")
      end

      -- 0.11対応: vim.lsp.config で各サーバーを設定
      local servers = { "ruby_lsp", "ts_ls", "lua_ls" }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
        })
        vim.lsp.enable(server)
      end
    end,
  },

  -- フォーマッタ
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ruby           = { "rubocop" },
        typescript     = { "prettier" },
        typescriptreact = { "prettier" },
        javascript     = { "prettier" },
        rust           = { "rustfmt" },
        lua            = { "stylua" },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },

  -- Rust専用
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",
  },
}
