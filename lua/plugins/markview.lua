return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local cmd = require("utils").cmd

    require("render-markdown").setup {
      preset = "obsidian",

      ignore = function(buf)
        if vim.bo[buf].buftype ~= "nofile" then
          return false
        end

        -- Disable Markdown Render for floating windows
        -- Lsp Signature, nvim-notify etc
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) == buf then
            local cfg = vim.api.nvim_win_get_config(win)
            if cfg.relative ~= "" then
              return true
            end
          end
        end

        return false
      end,

      -- document = {
      --   enabled = false,
      -- },

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
