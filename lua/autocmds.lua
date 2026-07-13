require "nvchad.autocmds"

vim.api.nvim_create_augroup("setIndent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "setIndent",
  pattern = {
    "css",
    "html",
    "javascript",
    "lua",
    "markdown",
    "md",
    "typescript",
    "scss",
    "xml",
    "xhtml",
    "yaml",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

