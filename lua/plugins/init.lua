return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Lazygit integration in Neovim
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit", -- Load plugin only when `:LazyGit` is used
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required dependency for lazygit.nvim
    },
    config = function() end,
  },
  -- VS Code-like template string converter
  {
    "axelvc/template-string.nvim",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "svelte",
      "python",
      "cs",
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("template-string").setup {
        filetypes = {
          "html",
          "typescript",
          "javascript",
          "typescriptreact",
          "javascriptreact",
          "vue",
          "svelte",
          "python",
          "cs",
        },
        jsx_brackets = true, -- Add brackets in JSX if needed
        remove_template_string = false, -- Do not revert backtick to quotes after editing
        restore_quotes = {
          normal = [[']], -- Use single quotes for normal strings
          jsx = [["]], -- Use double quotes in JSX
        },
      }
    end,
  },
  -- UI enhancement: Replace vim.ui.select with Telescope dropdown
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = true,
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}, -- Use dropdown style for select menus
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
  },
  -- Auto-close & rename HTML/JSX tags using Treesitter
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" }, -- Load on file read or new file
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Rename paired tags
          enable_close_on_slash = false, -- Disable slash-triggered auto-close
        },
        per_filetype = {
          -- Override or disable behavior per filetype if needed
        },
      }
    end,
  },
  --  Markdown rendering and preview
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" }, -- Load plugin only for markdown files
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim", -- or use 'mini.icons' or 'nvim-web-devicons' instead
    },
    config = function()
      require("render-markdown").setup {
        -- Optional: add config here if needed
      }
    end,
  },
  -- Neovim Tmux Navigation
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      preset = "helix", dofile(vim.g.base46_cache .. "whichkey")
      return {
        preset = "helix",
      }
    end,
  },
  -- test new blink
  { import = "nvchad.blink.lazyspec" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
      },
    },
    auto_install = true, -- Automatically install missing parsers
  },
}

-- GitHub Copilot integration
-- {
--   "github/copilot.vim",
--   lazy = true, -- Load plugin lazily
--   config = function()
--     -- Use default key mappings
--     vim.g.copilot_assume_mapped = true
--   end,
-- },

-- -- Noice.nvim Plugin for enhanced command line UI
-- {
--   "folke/noice.nvim",
--   event = "VeryLazy", -- Load on very lazy event
--   dependencies = {
--     "MunifTanjim/nui.nvim", -- Required dependency for noice
--     {
--       "rcarriga/nvim-notify", -- Optional: use nvim-notify for notifications
--       config = function()
--         require("notify").setup {
--           background_colour = "#000000",
--           max_width = 30,
--           max_height = 10,
--           timeout = 3000,
--           stages = "fade_in_slide_out",
--           render = "default",
--         }
--       end,
--     },
--   },
--   config = function()
--     require("noice").setup {
--       lsp = {
--         override = {
--           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--           ["vim.lsp.util.stylize_markdown"] = false,
--         },
--       },
--       presets = {
--         bottom_search = true, -- Enable bottom search bar
--         command_palette = true, -- Enable command palette
--         long_message_to_split = true, -- Split long messages
--       },
--     }
--   end,
-- },
