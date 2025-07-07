-- Leader Key
local leaderMap = function()
  -- 设置全局 Leader
  vim.g.mapleader = ','
  -- 设置本地 Leader
  vim.g.maplocalleader = ','
end

local loadCore = function()
  leaderMap()

  require('core.options')
  require('core.lazy')

  -- vim.api.nvim_set_option_value('background', settings.background, {})
  vim.cmd.colorscheme('tokyonight-night')
end

loadCore()
