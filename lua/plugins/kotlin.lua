return {
  enabled = true,
  "AlexandrosAlexiou/kotlin.nvim",
  ft = { "kotlin" },
  dependencies = {
    "stevearc/oil.nvim",
  },
  config = function()
    require("kotlin").setup {
      root_markers = {
        "gradlew",
        ".git",
        "mvnw",
        "settings.gradle",
      },

      jvm_args = {
        "-Xmx4g",
      },

      -- Optional: Configure inlay hints (requires kotlin-lsp v261+)
      -- All settings default to true, set to false to disable specific hints
      inlay_hints = {
        enabled = true, -- Enable inlay hints (auto-enable on LSP attach)
        parameters = true, -- Show parameter names
        parameters_compiled = true, -- Show compiled parameter names
        parameters_excluded = false, -- Show excluded parameter names
        types_property = true, -- Show property types
        types_variable = true, -- Show local variable types
        function_return = true, -- Show function return types
        function_parameter = true, -- Show function parameter types
        lambda_return = true, -- Show lambda return types
        lambda_receivers_parameters = true, -- Show lambda receivers/parameters
        value_ranges = true, -- Show value ranges
        kotlin_time = true, -- Show kotlin.time warnings
      },

      -- Optional: LSP-driven folding (requires kotlin-lsp v262.4739.0+)
      -- Enabled by default; set folding.enabled = false to opt out.
      folding = { enabled = true },
    }

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      vim.cmd "KotlinFormat"
    end, { desc = "Format Buffer" })

    vim.keymap.set({ "n" }, "gd", function()
      vim.cmd "KotlinTypeDefinition"
    end, { desc = "Goto Definition" })

    vim.keymap.set({ "n" }, "gI", function()
      vim.cmd "KotlinImplementation"
    end, { desc = "Goto Implementation" })

    -- vim.keymap.set({ "n" }, "<leader>ca", function()
    --   vim.cmd "KotlinCodeActions"
    -- end, { desc = "Code actions" })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "kotlin" },
      callback = function()
        vim.cmd "KotlinFormat"
      end,
    })
  end,
}
