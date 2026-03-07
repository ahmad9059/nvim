-- Load NvChad's default LSP config (includes `on_attach` and `capabilities`)
local default_config = require "nvchad.configs.lspconfig"
local on_attach = default_config.on_attach
local capabilities = default_config.capabilities

-- LspAttach autocmd for keymaps and per-server tweaks
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    -- NvChad's default on_attach
    on_attach(client, bufnr)

    -- Extra keymaps
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- Disable formatting for ts_ls to avoid conflict with prettier
    if client and client.name == "ts_ls" then
      client.server_capabilities.documentFormattingProvider = false
    end

    -- Auto-fix all ESLint issues on save (use augroup to prevent stacking)
    if client and client.name == "eslint" then
      local group = vim.api.nvim_create_augroup("EslintFixAll_" .. bufnr, { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end
  end,
})

-- Round borders on LSP hover (K) and signature help popups
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- Global capabilities for all servers
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- HTML LSP
vim.lsp.config("html", {})

-- CSS LSP
vim.lsp.config("cssls", {})

-- TailwindCSS LSP (only starts if tailwind config exists)
vim.lsp.config("tailwindcss", {
  root_markers = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts" },
})

-- Bash LSP
vim.lsp.config("bashls", {
  filetypes = { "sh", "bash" },
})

-- Markdown LSP (Marksman)
vim.lsp.config("marksman", {
  filetypes = { "markdown", "markdown.mdx" },
})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  settings = {
    typescript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
        importModuleSpecifierPreference = "shortest",
      },
    },
    javascript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
        importModuleSpecifierPreference = "shortest",
      },
    },
  },
})

-- JSON LSP
vim.lsp.config("jsonls", {})

-- ESLint LSP
vim.lsp.config("eslint", {})

-- Emmet LSP
vim.lsp.config("emmet_ls", {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescriptreact",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})

-- GraphQL LSP (only starts if graphql config exists)
vim.lsp.config("graphql", {
  filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
  root_markers = { ".graphqlrc", ".graphqlrc.yml", ".graphqlrc.yaml", ".graphqlrc.json", "graphql.config.js", "graphql.config.ts" },
})

-- YAML LSP
vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        -- Docker Compose
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
          "docker-compose*.yml",
          "compose*.yml",
        },
        -- GitHub Actions
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.yml",
      },
      validate = true,
      completion = true,
      hover = true,
    },
  },
})

-- C/C++ LSP
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

-- Prisma LSP
vim.lsp.config("prismals", {})

-- Docker LSP
vim.lsp.config("dockerls", {})

-- Docker Compose LSP
vim.lsp.config("docker_compose_language_service", {})

-- Lua LSP (lazydev.nvim handles workspace/library automatically)
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
      runtime = {
        version = "LuaJIT",
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Enable all servers
vim.lsp.enable {
  "html",
  "cssls",
  "tailwindcss",
  "bashls",
  "marksman",
  "ts_ls",
  "jsonls",
  "eslint",
  "emmet_ls",
  "graphql",
  "yamlls",
  "clangd",
  "prismals",
  "dockerls",
  "docker_compose_language_service",
  "lua_ls",
}

-- -- Python LSP
-- vim.lsp.config("pyright", {})
-- vim.lsp.enable { "pyright" }
