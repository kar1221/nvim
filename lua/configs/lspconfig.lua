require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "nvchad.configs.lspconfig"
local original_on_attach = lspconfig.on_attach

lspconfig.on_attach = function(client, bufnr)
  original_on_attach(client, bufnr)
  pcall(vim.keymap.del, "n", "<leader>ra", { buffer = bufnr })
end

lspconfig.defaults()

require "configs.lsp"
