local M = { 'nvim-treesitter/nvim-treesitter' }

M.build = ':TSUpdate'

M.config = function()
  local opts = {}
  opts.ensure_installed = { 'vim', 'lua', 'css', 'scss', 'html', 'javascript', 'typescript', 'tsx', 'json', 'vue', 'php' }

  opts.sync_install = false

  opts.auto_install = true

  opts.ignore_install = { 'javascript' }

  opts.highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }

  opts.indent = {
		enable = true,
	}

  -- -- 启用增量选择
  opts.incremental_selection = {
		enable = true,
		-- init_selection: in normal mode, start incremental selection.
		-- node_incremental: in visual mode, increment to the upper named parent.
		-- scope_incremental: in visual mode, increment to the upper scope
		-- node_decremental: in visual mode, decrement to the previous named node.
		keymaps = {
			init_selection = 'gss',
			node_incremental = 'gsi',
			scope_incremental = 'gsc',
			node_decremental = 'gsd',
		},
	}

  require('nvim-treesitter.configs').setup(opts)
end

return M
