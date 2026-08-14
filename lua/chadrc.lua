-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

---@type ThemeName
local theme = "everblush"

M.base46 = {
  theme = theme,
  transparency = false,

  integrations = {
    "blink-pair",
    "blink",
    "cmp",
    "defaults",
    "devicons",
    "flash",
    "git",
    "gitsigns",
    "lsp",
    "markview",
    "mason",
    "notify",
    "nvcheatsheet",
    "nvimtree",
    "render-markdown",
    "semantic_tokens",
    "statusline",
    "syntax",
    "tbline",
    "telescope",
    "tiny-inline-diagnostic",
    "todo",
    "treesitter",
    "trouble",
    "whichkey",
  },

  hl_override = {},
}

M.ui = {
  cmp = {
    icons_left = true,
    style = "default",
    format_colors = {
      lsp = true,
    },
  },

  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  tabufline = {
    order = { "treeOffset", "buffers" },
  },
}

M.colorify = {
  enabled = true,
  mode = "bg",
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--   tabufline = {
--     lazyload = false,
--   },
-- }

return M
