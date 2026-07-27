vim.lsp.enable("rust_analyzer", false)

vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      -- vim.keymap.set("n", "<leader>ca", function()
      --   vim.cmd.RustLsp "codeAction"
      -- end, { desc = "Code Action", buffer = bufnr })
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        -- Add clippy lints for Rust if using rust-analyzer
        checkOnSave = true,
        diagnostics = true,
        procMacro = {
          enable = true,
        },
        files = {
          exclude = {
            ".direnv",
            ".git",
            ".jj",
            ".github",
            ".gitlab",
            "bin",
            "node_modules",
            "target",
            "venv",
            ".venv",
          },
          watcher = "client",
        },
      },
    },
  },
}
