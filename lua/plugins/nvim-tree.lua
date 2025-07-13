local M = { 'nvim-tree/nvim-tree.lua' }

M.dependencies = { 'nvim-tree/nvim-web-devicons' }

M.version = '*'
M.event = 'VimEnter'
M.lazy = true

M.keys = {
  { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'toggle nvim-tree' },
}

M.config = function()
  local opts = {}

  require('nvim-tree').setup(opts)
end

return M
