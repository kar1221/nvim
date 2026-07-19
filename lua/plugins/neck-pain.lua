return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  event = "BufEnter",
  opts = {
    mappings = {
      enabled = true,
      toggle = "<Leader>zz",
      toggleLeftSide = "<Leader>zl",
      toggleRightSide = "<Leader>zr",
      widthUp = "<Leader>zu",
      widthDown = "<Leader>zd",
      scratchPad = "<Leader>zs",
    },
    buffers = {
      wo = {
        number = true,
        relativenumber = true
      },
      bo = {
        filetype = "md"
      },
      scratchPad = {
        enabled = true,
        pathToFile = nil
      }
    }
  },
}
