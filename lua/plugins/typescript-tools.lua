
return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  -- lazy = false,
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "svelte", "vue" },
  opts = {
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "svelte", "vue" },
    settings = {
      separate_diagnostic_server = true,
      publish_diagnostic_on = "insert_leave",
      expose_as_code_action = "all",
      tsserver_plugins = {
        "@vue/typescript-plugin",
        "typescript-svelte-plugin",
      },
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
    },
  },
}
