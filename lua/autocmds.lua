require "nvchad.autocmds"

local group = vim.api.nvim_create_augroup("TSIndent", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = group,
  callback = function(args)
    local bufnr = args.buf

    -- Skip special buffers
    if vim.bo[bufnr].buftype ~= "" then
      return
    end

    -- Skip unnamed buffers
    if vim.api.nvim_buf_get_name(bufnr) == "" then
      return
    end

    vim.b[bufnr].did_indent = 1
    vim.treesitter.start(bufnr)
    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
