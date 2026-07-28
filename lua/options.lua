require "nvchad.options"

-- add yours here!

local o = vim.o
--

o.relativenumber = true
o.scrolloff = 20

vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.cursorline = false
vim.o.cmdheight = 0
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.cindent = false
vim.o.termguicolors = true
