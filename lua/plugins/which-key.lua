local M = { 'folke/which-key.nvim' }

M.event = 'VeryLazy'

M.opts = {}

M.keys = {
  {
    '<leader>?',
    function()
      require('which-key').show({ global = false })
    end,
    desc = 'Buffer Local Keymaps (which-key)',
  }
}

return M
