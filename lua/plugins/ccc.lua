return {
  "uga-rosa/ccc.nvim",
  event = "LspAttach",
  config = function()
    local cmd = require("utils").cmd
    require("ccc").setup {
      recognize = {
        input = true,
        output = true,
      },

      highlighter = {
        auto_enable = false,
      },
    }

    vim.keymap.set("n", "<C-m>", cmd "CccPick", { desc = "Color picker" })
  end,
}
