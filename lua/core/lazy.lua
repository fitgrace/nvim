local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

local M = {}

M.load = function()
  return (vim.uv or vim.loop).fs_stat(lazypath)
end

M.install = function()
  local lazyRepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyRepo, lazypath })
end

M.setup = function()
  if not M.load() then
    M.install()
  end

  vim.opt.rtp:prepend(lazypath)
  local status_ok, lazy = pcall(require, 'lazy')
  if not status_ok then
    vim.notify('No lazy.nvim')
    return
  end

  local opts = {
    spec = {
      -- 导入插件
      { import = 'plugins' },
      { import = 'plugins.colorscheme' },
    },
    -- 安装时使用的配色方案
    install = { colorscheme = { 'tokyonight' } },
    -- 启用自动更新检查
    checker = { enabled = true },
  }

  lazy.setup(opts)

  vim.keymap.set('n', '<leader>L', '<cmd>:Lazy<cr>', { desc = 'Plugin Manager' })
end

M.setup()
