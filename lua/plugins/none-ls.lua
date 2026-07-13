return {
  "nvimtools/none-ls.nvim",

  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },

  event = "BufEnter",
  opts = function()
    local null_ls = require "null-ls"

    null_ls.setup {
      sources = {
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.formatting.csharpier,
        require "none-ls.code_actions.eslint",
      },
    }
  end,
}
