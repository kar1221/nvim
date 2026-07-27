local options = {
  formatters = {
    rubocop = {
      args = { "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
    },
    ktfmt = {
      command = "ktfmt",
      args = { "--kotlinlang-style", "-" },
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    vue = { "prettier" },
    ruby = { "rubocop" },
    eruby = { "erb_format" },
    dart = { "dart_format" },
    go = { "goimports", "gofumpt" },
    cs = { "csharpier" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    kotlin = { "ktfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
