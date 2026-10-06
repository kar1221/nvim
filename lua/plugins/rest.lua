return {
  event = "VeryLazy",
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("telescope").load_extension "rest"

    local cmd = require("utils").cmd
    vim.keymap.set("n", "<leader>ra", cmd "Rest open", { desc = "Rest open" })
    vim.keymap.set("n", "<leader>rr", cmd "Rest run", { desc = "Rest run under cursor" })
    vim.keymap.set("n", "<leader>rR", cmd "Rest last", { desc = "Rest run last request" })
    vim.keymap.set("n", "<leader>re", cmd "Rest env select", { desc = "Rest select env" })
    vim.keymap.set("n", "<leader>rE", cmd "Rest env show", { desc = "Rest show env" })
  end,
}
