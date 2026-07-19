return {
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
  config = true,
}
