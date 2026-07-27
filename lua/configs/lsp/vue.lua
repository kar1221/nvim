local vue_language_server_path = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

-- local svelte_path = vim.fn.stdpath "data"
--   .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin"

local tsserver_filetypes = { "vue" }

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

-- local svelte_plugin = {
--   {
--     name = "typescript-svelte-plugin",
--     location = svelte_path,
--     languages = { "svelte" },
--     enableForWorkspaceTypeScriptVersions = true,
--   },
-- }

local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
          -- svelte_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}

local vue_ls_config = {}

vim.lsp.enable "vtsls"
vim.lsp.enable "vue_ls"
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
