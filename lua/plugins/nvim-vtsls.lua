return {
  "yioneko/nvim-vtsls",
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "svelte", "vue" },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "vtsls" then
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
          end

          local exec = function(c)
            return function()
              local full_cmd = "VtsExec " .. c
              vim.cmd(full_cmd)
            end
          end

          map("<leader>co", exec "organize_imports", "Organize Imports")
          map("<leader>cs", exec "sort_imports", "Sort Imports")
          map("<leader>cU", exec "remove_unused_imports", "Remove Unused Imports")
          map("<leader>cu", exec "remove_unused", "Remove Unused")
          map("<leader>cm", exec "add_missing_imports", "Add Missing Imports")
          map("gS", exec "goto_source_definition", "Go to Source Definition")
          map("<leader>cR", exec "rename_file", "Rename File")
          map("<leader>cF", exec "file_references", "File References")
        end
      end,
    })
  end,
}
