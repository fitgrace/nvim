local M = { 'saghen/blink.cmp' }

M.dependencies = {
  'rafamadriz/friendly-snippets'
}

M.version = '*'

M.opts = {
  keymap = { preset = 'enter' },

  appearance = {
    nerd_font_variant = 'mono'
  },

  completion = { documentation = { auto_show = false } },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' }
}

M.opts_extend = { 'sources.default' }

return M
