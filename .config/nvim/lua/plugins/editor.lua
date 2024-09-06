local disabled = false
-- disabled = true
if disabled then
  return {}
end


-- Nvimtree Settings
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<bs>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '.', api.tree.change_root_to_node, opts('CD'))
end

-- ToggleTerm Run Function
local Run = function(type, task, close_on_exit)
  local Terminal = require("toggleterm.terminal").Terminal
  local buildCommand = "g++ " .. "-o " .. vim.fn.expand "%:p:r" .. " " .. vim.fn.expand "%:p"
  local executeCommand = vim.fn.expand "%:p:r"
  local inputFile = vim.fn.expand "%:p:h" .. "/" .. vim.fn.expand "%:p:t:r" .. "_input" .. ".txt"
  local outputFile = vim.fn.expand "%:p:h" .. "/" .. vim.fn.expand "%:p:t:r" .. "_output" .. ".txt"
  local createInput = "touch " .. inputFile
  local getOutput = vim.fn.expand "%:p:r" .. " <" .. inputFile .. " >" .. outputFile
  local runCommand = createInput .. " && " .. getOutput .. " && cat " .. outputFile
  local cmd
  if type == "preInput" then
    if task == "BuildRun" then
      cmd = buildCommand .. " && " .. runCommand
    elseif task == "Run" then
      cmd = runCommand
    else
      cmd = createInput .. " && nvim " .. inputFile
    end
  else
    if task == "BuildRun" then
      cmd = buildCommand .. "&&" .. executeCommand
    else
      cmd = executeCommand
    end
  end
  local job = Terminal:new {
    cmd = cmd,
    close_on_exit = close_on_exit,
    direction = "float",
    float_opts = {
      winblend = 10,
      border = "curved",
    },
  }
  job:toggle()
end



local colors = require("base46").get_theme_tb "base_30"

local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = my_on_attach,
    }
  },
  {
    {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      opts = {
        highlights = {
          FloatBorder = {
            guifg = colors.blue
            -- guifg = "Pmenu",
            -- guibg = "#000000",
          },
        },
        float_opts = {
          border = "curved",
          winblend = 10,
        }
      },
      keys = {
        {
          mode = {"t", "n"},
          "<M-i>",
          "<cmd>ToggleTerm direction=float<cr>"
        },
        {
          "<C-p>",
          function()
            require("toggleterm").toggle()
          end,
        },
        {
          "<leader>bb",
          function()
            Run("preInput", "BuildRun", false)
          end,
        },
        {
  "<leader>br",
          function()
            Run("preInput", "Run", false)
          end,
        },
        {
          "<leader>bi",
          function()
            Run("preInput", "editInput", true)
          end,
        },
        {
          "<C-b>",
          function()
            Run("execute", "BuildRun", false)
          end,
        },
        {
          "<F5>", --[[ Not working for some reasons ]]
          function()
            Run("execute", "Run", false)
          end,
        },
      },
    },
  }
}

return plugins
