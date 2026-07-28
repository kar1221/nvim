local web_lsp = {
  "html",
  "cssls",
  "css_variables",
  "cssmodules_ls",
  "emmet_language_server",
  "eslint",
  "jsonls",
  "tailwindcss",
  "vue_ls",
  "svelte",
  "vtsls",
}

vim.lsp.enable(web_lsp)

local vue_language_server_path = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_typescript_plugin_path = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin"

local svelte_path = vim.fn.stdpath "data"
  .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
  enableForWorkspaceTypeScriptVersions = true,
}

local svelte_plugin = {
  name = "typescript-svelte-plugin",
  location = svelte_path,
  enableForWorkspaceTypeScriptVersions = true,
}

local tsserver_filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "svelte", "vue" }

local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
          svelte_plugin,
        },
      },
      experimental = {
        maxInlayHintLength = 30,
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
    },

    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
      preferGoToSourceDefinition = true,
    },

    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      preferGoToSourceDefinition = true,

      preferences = {
        preferTypeOnlyAutoImports = true,
      },

      inlayHints = {
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        enumMemberValues = { enabled = true },
        variableTypes = { enabled = false },
      },

      suggest = {
        completeFunctionCalls = true,
      },

      tsserver = {
        maxTsServerMemory = 6144,
      },
    },
  },
  filetypes = tsserver_filetypes,
}

local vue_ls_config = {}

vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
