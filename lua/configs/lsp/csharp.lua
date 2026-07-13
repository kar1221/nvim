vim.lsp.enable "fsautocomplete"
vim.lsp.enable "csharp_ls"

require("csharpls_extended").buf_read_cmd_bind()
require("telescope").load_extension("csharpls_definition")
