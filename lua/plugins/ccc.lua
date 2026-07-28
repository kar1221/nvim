return {
  "uga-rosa/ccc.nvim",
  event = "LspAttach",
  config = function()
    require("ccc").setup {
      recognize = {
        input = true,
        output = true,
      },

      highlighter = {
        auto_enable = false,
      },
    }
  end,
}
