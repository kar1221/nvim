require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

local tab = require "nvchad.tabufline"

unmap("n", "<leader>e")
unmap("n", "<C-n>")

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", ":m .+1<CR>==gi")
map("i", "<A-k>", ":m .-2<CR>==gi")

map("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })

map({ "n", "v" }, "<leader>cf", function()
  require("conform").format()
end, { desc = "Format Buffer" })

map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })

map("n", "<S-h>", function()
  tab.prev()
end, { desc = "Previous buffer" })

map("n", "<S-l>", function()
  tab.next()
end, { desc = "Next buffer" })

map("n", "<leader>bd", function()
  tab.close_buffer()
end, { desc = "Close current buffer" })

map("n", "<leader>bo", function()
  tab.closeAllBufs(false)
end, { desc = "Close other buffer" })

for i = 1, 9, 1 do
  map("n", string.format("<leader>%s", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, { desc = string.format("Switch to tab %s", i) })
end

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

map("n", "<leader>ca", function()
  require("actions-preview").code_actions()
end, { desc = "Code action" })
