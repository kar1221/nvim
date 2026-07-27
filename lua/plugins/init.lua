return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = require "configs.mason",
    },
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "saghen/blink.cmp",
    -- version = "2.*",
    dependencies = {
      -- "saghen/blink.lib",
      --
      "onsails/lspkind.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sources = {
        providers = {
          lsp = {
            score_offset = 10,
          },

          snippets = {
            score_offset = 8,
          },

          buffer = {
            score_offset = 6,
          },

          path = {
            score_offset = 4,
          },
        },
      },

      fuzzy = {
        sorts = {
          -- function(a, b)
          --   if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
          --     return
          --   end
          --   return b.client_name == "emmet-language-server"
          -- end,
          -- defaults
          "exact",
          "score",
          "sort_text",
        },
      },
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },

        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },
      completion = {
        trigger = {
          show_on_trigger_character = false,
        },
        menu = {
          draw = {
            components = {
              kind = {
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbol_map[ctx.kind] or ""
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    opts = {
      -- Apparently this was for master branch of tree-sitter
      -- indent = {
      --   enable = false,
      -- },
      -- But that means ensure_installed is deprecated now though
      -- Not sure how would nvchad handle it
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "vue",
        "typescript",
        "javascript",
        "svelte",
        "bash",
        "c",
        "dart",
        "cmake",
        "cpp",
        "css",
        "json",
        "sql",
        "tsx",
        "rust",
        "ruby",
        "dart",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "c_sharp",
        "html",
      },
    },
  },
}
