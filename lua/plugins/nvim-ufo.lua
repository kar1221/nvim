return {
  "kevinhwang91/nvim-ufo",
  event = "BufEnter",
  dependencies = {
    "kevinhwang91/promise-async",
  },

  opts = function()
    require("ufo").setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    }
  end,
}
