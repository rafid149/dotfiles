return {
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {{"<leader>zn", "<cmd>ZenMode<cr>"}},
    dependencies = {"folke/twilight.nvim"},
    opts = {
      window = {
        backdrop = 0.5,
      }, plugins = {
        tmux = {
          enabled = true,
        },
      }
    }
  },
}
