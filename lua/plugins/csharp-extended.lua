return {
  "Decodetalkers/csharpls-extended-lsp.nvim",
  lazy = true,
  ft = "cs",
  config = function()
    require("csharpls_extended").buf_read_cmd_bind()
    require("telescope").load_extension "csharpls_definition"
  end,
}
