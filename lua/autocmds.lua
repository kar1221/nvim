require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("TSIndent", { clear = true }),
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
  group = vim.api.nvim_create_augroup("user-treesitter", { clear = true }),
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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user-lsp-config", { clear = true }),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })

      vim.keymap.set("n", "<leader>ui", function()
        local current_setting = vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }
        vim.lsp.inlay_hint.enable(not current_setting, { bufnr = bufnr })
      end, { desc = "Toggle inlay hint" })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "cs" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})
