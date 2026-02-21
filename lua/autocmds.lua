require "nvchad.autocmds"

-- Treat .env, .env.local, .env.production etc. as sh for syntax highlighting
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".env", ".env.*", "*.env" },
  callback = function()
    vim.bo.filetype = "sh"
  end,
})
