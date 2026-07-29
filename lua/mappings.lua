-- require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local cmd = require("utils").cmd

-- unmap("n", "<leader>e")
-- unmap("n", "<C-n>")
-- unmap("n", "<leader>ff")
-- unmap("n", "<leader>fw")
-- unmap("n", "<leader>fa")
-- unmap("n", "<leader>cm")
-- unmap("i", "<C-b>")
-- unmap("i", "<C-e>")
-- unmap("n", "<tab>")
-- unmap("n", "<S-tab>")
-- unmap("n", "<leader>x")
-- unmap("n", "<leader>h")
-- unmap("n", "<leader>v")

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "Switch Window Left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch Window Right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch Window Up" })

-- Escape
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear Highlights" })

map("n", "<C-Up>", cmd "resize +2", { desc = "Increase Window Height" })
map("n", "<C-Down>", cmd "resize -2", { desc = "Decrease Window Height" })
map("n", "<C-Left>", cmd "vertical resize -2", { desc = "Decrease Window Width" })
map("n", "<C-Right>", cmd "vertical resize +2", { desc = "Increase Window Width" })

map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })

-- NvimTree
map("n", "<leader>e", function()
  local tree = require("nvim-tree.api").tree

  local is_visible = tree.is_visible()

  if not is_visible then
    tree.open()
  else
    tree.close()
  end
end, { desc = "Toggle NvimTree" })

-- Lsp
map("n", "gI", function()
  vim.lsp.buf.implementation()
end, { desc = "Goto Implementation" })

map({ "n", "v" }, "<leader>cf", function()
  require("conform").format { lsp_format = "fallback" }
end, { desc = "Format Buffer" })

map("n", "<leader>cr", require "nvchad.lsp.renamer", { desc = "Rename" })

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code action" })

-- Tab
map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous buffer" })

map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "Next buffer" })

map("n", "<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close current buffer" })

map("n", "<leader>bo", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "Close other buffer" })

for i = 1, 9, 1 do
  map("n", string.format("<leader>%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = string.format("Switch to tab %s", i) })
end

-- Better search

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Telescope
map("n", "<leader><leader>", cmd "Telescope find_files", { desc = "telescope find files" })
map("n", "<leader>ff", cmd "Telescope find_files", { desc = "telescope find files" })
map("n", "<leader>f/", cmd "Telescope live_grep", { desc = "telescope live grep" })
map(
  "n",
  "<leader>fF",
  cmd "Telescope find_files follow=true no_ignore=true hidden=true",
  { desc = "telescope find all files" }
)
map("n", "<leader>fc", cmd "Telescope git_commits", { desc = "telescope find commits" })
map("n", "<leader>fg", cmd "Telescope git_status", { desc = "telescope find git status" })

map("n", "<leader>ft", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })
-- Terminals
map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "Terminal Horizontal (New)" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "Terminal Vertical (New)" })

map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Terminal Vertical (Toggle)" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal Horizontal (Toggle)" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Floating (Toggle)" })
