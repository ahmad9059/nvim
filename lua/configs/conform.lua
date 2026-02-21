local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    sh = { "shfmt" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    html = { "prettierd" },
    css = { "prettierd" },
    scss = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" }, -- tsconfig.json, .eslintrc.json use JSONC
    markdown = { "prettierd" },
    yaml = { "prettierd" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback", -- replaces deprecated lsp_fallback = true
  },
}

return options
