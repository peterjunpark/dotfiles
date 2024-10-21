local add = MiniDeps.add
local map = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

add { source = 'stevearc/conform.nvim' }

local conform = require 'conform'

conform.setup {
	notify_on_error = true,
	formatters_by_ft = {
		lua = { 'stylua' },
		go = { 'goimports', 'gofmt' },
	},
}

map('<leader>w', function()
	conform.format {
		async = true,
		lsp_format = 'fallback',
	}
end, 'Format buffer')
