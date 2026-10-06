return {
  "GustavEikaas/easy-dotnet.nvim",
  ft = { "cs" },
  dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim" },
  config = function()
    local cmd = require("utils").cmd
    require("easy-dotnet").setup {
      lsp = {
        config = {
          settings = {
            ["csharp|code_lens"] = {
              dotnet_enable_references_code_lens = false,
            },
          },
        },
      },
    }

    vim.keymap.set("n", "<leader>cDr", cmd "Dotnet run", { desc = "Dotnet: Run Project" })
    vim.keymap.set("n", "<leader>cDw", cmd "Dotnet watch", { desc = "Dotnet: Run Project with Watch" })
    vim.keymap.set("n", "<leader>cDt", cmd "Dotnet test", { desc = "Dotnet: Run Tests" })
    vim.keymap.set("n", "<leader>cDsr", cmd "Dotnet _server restart", { desc = "Dotnet: Server Restart" })
    vim.keymap.set("n", "<leader>cDss", cmd "Dotnet _server start", { desc = "Dotnet: Server Start" })
    vim.keymap.set("n", "<leader>cDsx", cmd "Dotnet _server stop", { desc = "Dotnet: Server Stop" })
    vim.keymap.set("n", "<leader>cDR", cmd "Dotnet restore", { desc = "Dotnet: Restore" })
    vim.keymap.set("n", "<leader>cDa", cmd "Dotnet add package", { desc = "Dotnet: Add Package" })
  end,
}
