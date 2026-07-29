return {
  "willothy/moveline.nvim",
  build = "make",
  event = "BufEnter",

  config = function()
    vim.keymap.set({ "n", "i" }, "<A-j>", function()
      require("moveline").down()
    end, { desc = "Move Down" })

    vim.keymap.set({ "n", "i" }, "<A-k>", function()
      require("moveline").up()
    end, { desc = "Move Up" })

    vim.keymap.set("v", "<A-j>", function()
      require("moveline").block_down()
    end, { desc = "Move Down" })

    vim.keymap.set("v", "<A-k>", function()
      require("moveline").block_up()
    end, { desc = "Move Up" })
  end,
}
