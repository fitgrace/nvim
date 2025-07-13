local M = { 'nvim-treesitter/nvim-treesitter-context' }

M.config = function()
  local opts = {}
  opts.max_lines = 0

  require('treesitter-context').setup(opts)
end

return M
