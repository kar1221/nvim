local cmd = require("utils").cmd

vim.lsp.enable "clangd"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "clangd" then
      vim.keymap.set("n", "<leader>ch", cmd "LspClangdSwitchSourceHeader", { desc = "Switch Header/Source" })
    end
  end,
})
