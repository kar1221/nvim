if true then
  return {}
end

return {
  "Decodetalkers/csharpls-extended-lsp.nvim",
  lazy = true,
  ft = "cs",
  config = function()
    require("csharpls_extended").buf_read_cmd_bind()
    require("telescope").load_extension "csharpls_definition"

    vim.lsp.config("csharp_ls", {
      cmd = function(dispatchers, config)
        return vim.lsp.rpc.start({ "csharp-ls", "--features", "metadata-uris" }, dispatchers, {
          cwd = config.cmd_cwd or config.root_dir,
          env = config.cmd_env,
          detached = config.detached,
        })
      end,
      flags = {
        --allow_incremental_sync = false,
      },
      handlers = {
        ["textDocument/definition"] = require("csharpls_extended").handler,
        ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
      },
    })
  end,
}
