return {
  {
    enabled = true,
    "nvim-mini/mini.ai",
    event = "BufEnter",
    config = function()
      require("mini.ai").setup {}
    end,
  },
  {
    enabled = false,
    "nvim-mini/mini.pairs",
    event = "InsertEnter",
    version = false,
    config = function()
      require("mini.pairs").setup {}
    end,
  },
}
