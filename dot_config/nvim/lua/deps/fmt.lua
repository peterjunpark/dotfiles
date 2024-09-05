local add = MiniDeps.add
local map = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

add { source = 'stevearc/conform.nvim' }

local conform = require 'conform'

conform.setup {
	default_format_opts = {
		timeout_ms = 3000,
		async = false,
		quiet = false,
		lsp_format = 'fallback',
	},
	notify_on_error = true,
	formatters_by_ft = {
		lua = { 'stylua' },
		go = { 'goimports', 'gofmt' },
		fish = { 'fish_indent' },
		sh = { 'shfmt' },
	},
}

map('<leader>w', function()
	conform.format ()
end, 'Format buffer')
