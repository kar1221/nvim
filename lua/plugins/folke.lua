return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      -- bigfile = { enabled = true },
      -- dashboard = { enabled = true },
      -- explorer = { enabled = true },
      -- indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- {
      --   "rcarriga/nvim-notify",
      --   opts = {
      --     render = "compact",
      --     stages = "slide",
      --   },
      -- },
    },
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
        message = {
          enabled = false,
        },
        progress = {
          enabled = false,
        },
      },

      -- routes = {
      --   {
      --     filter = {
      --       event = "notify",
      --       find = "No information available",
      --     },
      --     opts = { skip = true },
      --   },
      --   {
      --     filter = {
      --       event = "notify",
      --       find = "No signature help available",
      --     },
      --     opts = { skip = true },
      --   },
      -- },

      -- messages = {
      --   enabled = false,
      -- },
      --
      -- popupmenu = {
      --   enabled = false,
      -- },
      --
      -- notify = {
      --   enabled = false,
      -- },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },

      -- views = {
      --   cmdline_popup = {
      --     position = {
      --       row = 2,
      --       col = "50%",
      --     },
      --     size = {
      --       width = 60,
      --     },
      --     border = {
      --       style = "rounded",
      --     },
      --   },
      -- },
    },
  },
}
