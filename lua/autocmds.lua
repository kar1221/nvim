require "nvchad.autocmds"

local group = vim.api.nvim_create_augroup("TSIndent", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = group,
  callback = function(args)
    local bufnr = args.buf

    if vim.bo[bufnr].buftype ~= "" then
      return
    end

    pcall(vim.treesitter.start, bufnr)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "svelte", "vue" },
  callback = function(args)
    local bufnr = args.buf

    vim.b[bufnr].did_indent = 1
    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.lsp.document_color.enable(true, { bufnr = ev.buf })
    vim.lsp.buf.code_action = require("actions-preview").code_actions
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("vtsls_svelte_signature", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.name == "vtsls" and vim.bo[ev.buf].filetype == "svelte" then
      client.server_capabilities.signatureHelpProvider = nil
    end
  end,
})
