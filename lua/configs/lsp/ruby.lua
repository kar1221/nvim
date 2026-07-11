vim.lsp.enable("solargraph")

vim.lsp.config("rubocop", {
  enabled = false,
})

vim.lsp.config("solargraph", {
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
    },
  },
})
