require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "vue_ls",
  "vtsls",
  "clangd", "css_variables",
  "cssmodules_ls",
  "emmet_language_server",
  "eslint",
  "jsonls",
  "svelte",
  "tailwindcss",
  "rust_analyzer",
  "solargraph",
  "dartls",
  "astro",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- Vue
-- ---------------------------------------------------------------
local vue_language_server_path = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}

local vue_ls_config = {}

vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)

-- vim.lsp.config("dartls", {
--   -- cmd = { "dart", "language-server", "--protocol=lsp" },
--   filetypes = { "dart" },
--   root_markers = { "pubspec.yml" },
--   settings = {
--     dart = {
--       completeFunctionCalls = true,
--       showTodos = true,
--     },
--   },
--   init_options = {
--     closingLabels = true,
--     flutterOutline = true,
--     onlyAnalyzeProjectsWithOpenFiles = true,
--     outline = true,
--     suggestFromUnimportedLibraries = true,
--   },
-- })

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

-- Vue
-- ---------------------------------------------------------------
