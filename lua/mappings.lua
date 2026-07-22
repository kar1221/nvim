require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<leader>e")
unmap("n", "<C-n>")

map({ "n", "i" }, "<A-j>", function()
  require("moveline").down()
end, { desc = "Move Down" })

map({ "n", "i" }, "<A-k>", function()
  require("moveline").up()
end, { desc = "Move Up" })

map("v", "<A-j>", function()
  require("moveline").block_down()
end, { desc = "Move Down" })

map("v", "<A-k>", function()
  require("moveline").block_up()
end, { desc = "Move Up" })

map("n", "<leader>e", function()
  local tree = require("nvim-tree.api").tree

  local is_visible = tree.is_visible()

  if not is_visible then
    tree.open()
  else
    tree.close()
  end
end, { desc = "Toggle NvimTree" })

map("n", "gI", function()
  vim.lsp.buf.implementation()
end, { desc = "Goto Implementation" })

map({ "n", "v" }, "<leader>cf", function()
  require("conform").format()
end, { desc = "Format Buffer" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

map("n", "<leader>cr", require "nvchad.lsp.renamer", { desc = "Rename" })

map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })

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

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

map("n", "<leader>ca", function()
  require("actions-preview").code_actions()
end, { desc = "Code action" })

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "typescript-tools" then
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
      end

      map("<leader>co", "<cmd>TSToolsOrganizeImports<cr>", "Organize Imports")
      map("<leader>cs", "<cmd>TSToolsSortImports<cr>", "Sort Imports")
      map("<leader>cU", "<cmd>TSToolsRemoveUnusedImports<cr>", "Remove Unused Imports")
      map("<leader>cu", "<cmd>TSToolsRemoveUnused<cr>", "Remove Unused")
      map("<leader>cm", "<cmd>TSToolsAddMissingImports<cr>", "Add Missing Imports")
      map("<leader>cg", "<cmd>TSToolsGoToSourceDefinition<cr>", "Go to Source Definition")
      map("<leader>cR", "<cmd>TSToolsRenameFile<cr>", "Rename File")
      map("<leader>cF", "<cmd>TSToolsFileReferences<cr>", "File References")
    end
  end,
})
