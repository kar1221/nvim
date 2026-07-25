require "nvchad.autocmds"

local group = vim.api.nvim_create_augroup("TSIndent", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = group,
  callback = function(args)
    local bufnr = args.buf

    if vim.bo[bufnr].buftype ~= "" then
      return
    end

    local ok = pcall(vim.treesitter.start, bufnr)
    if not ok then
      return
    end

    vim.b[bufnr].did_indent = 1
    vim.treesitter.start(bufnr)
    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.lsp.document_color.enable(true, { bufnr = ev.buf })
  end,
})
