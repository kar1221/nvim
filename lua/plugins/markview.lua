return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local cmd = require("utils").cmd

    require("render-markdown").setup {
      preset = "obsidian",

      completions = {
        lsp = {
          enabled = true,
        },

        blink = {
          enabled = true,
        },
      },
    }

    vim.keymap.set("n", "<leader>mm", cmd "RenderMarkdown toggle", { desc = "Toggle Render Markdown" })
  end,
}
