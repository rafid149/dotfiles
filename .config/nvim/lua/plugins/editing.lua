return {
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    keys = {
      { "<leader>hw", "<cmd>HopWord<cr>" },
      { "<leader>hl", "<cmd>HopLine<cr>" }
    },
      opts = {}
  },
  {
    'echasnovski/mini.move', -- Need to be configured
    version = false,
    keys = {
      {"<C-M-h>", mode = {"v", "n"}},
      {"<C-M-j>", mode = {"v", "n"}},
      {"<C-M-k>", mode = {"v", "n"}},
      {"<C-M-l>", mode = {"v", "n"}},
    },
    opts = {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<C-M-h>',
        right = '<C-M-l>',
        down = '<C-M-j>',
        up = '<C-M-k>',
        -- Move current line in Normal mode
        line_left = '<C-M-h>',
        line_right = '<C-M-l>',
        line_down = '<C-M-j>',
        line_up = '<C-M-k>',
      }
    }
  },
}
