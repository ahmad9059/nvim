return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- load only when a file is about to be opened
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Lua LSP workspace awareness (replaces manual vim.api.nvim_get_runtime_file)
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },

  -- Lazygit integration in Neovim
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- VS Code-like template string converter
  {
    "axelvc/template-string.nvim",
    ft = {
      "html",
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
        jsx_brackets = true,
        remove_template_string = false,
        restore_quotes = {
          normal = [['']],
          jsx = [[""]],
        },
      }
    end,
  },

  -- UI enhancement: Replace vim.ui.select with Telescope dropdown
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
  },

  -- Auto-close & rename HTML/JSX tags using Treesitter
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      }
    end,
  },

  -- Markdown rendering and preview
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim",
    },
    opts = {},
  },

  -- HTTP REST client for testing Node.js/Express API endpoints (.http files)
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = {},
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
      dofile(vim.g.base46_cache .. "whichkey")
      return {
        preset = "helix",
      }
    end,
  },

  -- blink completion
  { import = "nvchad.blink.lazyspec" },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
      },
      signature = { window = { border = "rounded" } },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "jsonc",
        "yaml",
        "dockerfile",
        "graphql",
        "prisma",
        "c",
        "cpp",
      },
      auto_install = true,
    },
  },
}
