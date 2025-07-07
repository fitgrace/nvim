local M = { 'folke/tokyonight.nvim' }

M.lazy = false
M.version = '*'
M.priority = 1000

M.config = function()
  require('tokyonight').setup({
    dim_inactive = true,
    on_colors = function(c)
      c.bg_dark = '#1e2030'
      c.border = c.dark3
    end
  })

  -- setup must be called before loading
  -- vim.cmd.colorscheme 'tokyonight-night'
end

return M
