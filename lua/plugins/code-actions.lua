return {
  "aznhe21/actions-preview.nvim",
  event = "LspAttach",
  config = function()
    require("actions-preview").setup {
      highlight_command = {
        -- require("actions-preview.highlight").delta(),
        -- require("actions-preview.highlight").diff_so_fancy(),
        require("actions-preview.highlight").diff_highlight(),
      },
    }
  end,
}
