local leaderMap = function()
  vim.g.mapleader = ','       -- 设置全局 Leader
  vim.g.maplocalleader = ','  -- 设置本地 Leader
end

local colorScheme = function()
  -- vim.api.nvim_set_option_value('background', settings.background, {})
  -- vim.cmd.colorscheme('tokyonight-night')
  -- vim.cmd.colorscheme('gruvbox')
  vim.cmd.colorscheme('catppuccin-mocha') -- catppuccin catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
end

local loadCore = function()
  leaderMap() -- Leader Key

  require('core.options')
  require('core.lazy')

  colorScheme() -- 配色方案
end

loadCore()
