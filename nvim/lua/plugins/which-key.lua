return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>g",  group = "git" },
      { "<leader>gh", group = "github" },
      { "<leader>f",  group = "find" },
    },
  },
}
