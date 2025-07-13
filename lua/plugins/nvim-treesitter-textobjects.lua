local M = { 'nvim-treesitter/nvim-treesitter-textobjects' }

M.dependencies = { 'nvim-treesitter/nvim-treesitter' }

M.config = function()

  local is_ok, configs = pcall(require, "nvim-treesitter.configs")
  if not is_ok then
    vim.notify('没有找到 treesitter-textobjects')
    return
  end

  local opts = {}

  configs.setup(opts)
end

return M
