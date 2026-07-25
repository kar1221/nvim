return {
  -- {
  --   "dart-lang/dart-vim-plugin",
  --   ft = { "dart" },
  -- },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = true,
    keys = {
      {
        "<leader>cF",
        function()
          require("telescope").extensions.flutter.commands()
        end,
        mode = "n",
        ft = "dart",
        desc = "Flutter tools",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "//",
        enabled = true,
      },
      lsp = {
        color = {
          enabled = true,
          background = true,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          enableSnippets = true,
        },
      },
    },
  },
}
