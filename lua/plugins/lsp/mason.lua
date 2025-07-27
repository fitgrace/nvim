local M = { 'mason-org/mason.nvim' }

-- M.cmd = 'Mason'
-- M.build = ':MasonUpdate'

-- M.keys = {
--   { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } 
-- }

M.opts = {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗'
    }
  }
}

return M
