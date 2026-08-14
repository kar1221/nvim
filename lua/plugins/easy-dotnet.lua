return {
  "GustavEikaas/easy-dotnet.nvim",
  ft = { "cs" },
  dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
  config = function()
    local cmd = require("utils").cmd
    require("easy-dotnet").setup()

    vim.keymap.set("n", "<leader>cDr", cmd "Dotnet run", { desc = "Dotnet: Run Project" })
    vim.keymap.set("n", "<leader>cDw", cmd "Dotnet watch", { desc = "Dotnet: Run Project with Watch" })
    vim.keymap.set("n", "<leader>cDt", cmd "Dotnet test", { desc = "Dotnet: Run Tests" })
    vim.keymap.set("n", "<leader>cDlr", cmd "Dotnet lsp restart", { desc = "Dotnet: Lsp Restart" })
    vim.keymap.set("n", "<leader>cDls", cmd "Dotnet lsp start", { desc = "Dotnet: Lsp Start" })
    vim.keymap.set("n", "<leader>cDlx", cmd "Dotnet lsp stop", { desc = "Dotnet: Lsp Stop" })
    vim.keymap.set("n", "<leader>cDP", cmd "Dotnet project view", { desc = "Dotnet: Project View" })
    vim.keymap.set("n", "<leader>cDR", cmd "Dotnet restore", { desc = "Dotnet: Restore" })
  end,
}
