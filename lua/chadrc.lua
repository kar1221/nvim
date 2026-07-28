-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

---@type ThemeName
local theme = "gruvbox"

local get_highlights = function()
  ---@type Base46HLGroupsList
  local h = {}

  -- if theme == "gruvbox" then
  --   h.NvimTreeFolderIcon = {
  --     fg = "vibrant_green",
  --   }
  --
  --   h.NvimTreeFolderName = {
  --     fg = "vibrant_green",
  --   }
  --
  --   h.NvimTreeOpenedFolderName = {
  --     fg = "vibrant_green",
  --   }

  return h
end

M.base46 = {
  theme = theme,
  transparency = true,

  hl_override = get_highlights(),
}

M.ui = {
  cmp = {
    icons_left = false,
    style = "default",
    format_colors = {
      lsp = true,
    },
  },

  statusline = {
    theme = "minimal",
    separator_style = "default",
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
