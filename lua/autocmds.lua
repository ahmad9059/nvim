require "nvchad.autocmds"

-- Disable folding specifically in kulala's floating response window
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local cfg = vim.api.nvim_win_get_config(vim.api.nvim_get_current_win())
    if cfg.relative == "" then return end
    local title = cfg.title or {}
    local text = type(title) == "string" and title
      or (type(title) == "table" and title[1] and title[1][1])
      or ""
    if text == "Kulala" then
      vim.wo.foldenable = false
    end
  end,
})

-- Treat .env, .env.local, .env.production etc. as sh for syntax highlighting
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".env", ".env.*", "*.env" },
  callback = function()
    vim.bo.filetype = "sh"
  end,
})
