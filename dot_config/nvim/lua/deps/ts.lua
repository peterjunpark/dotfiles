local parsers = {
	'bash',
	'c',
	'dart',
	'diff',
	'fish',
	'go',
	'gomod',
	'gosum',
	'gowork',
	'html',
	'http',
	'javascript',
	'jq',
	'jsdoc',
	'json',
	'latex',
	'lua',
	'luadoc',
	'luap',
	'markdown',
	'markdown_inline',
	'odin',
	'printf',
	'python',
	'query',
	'regex',
	'rst',
	'sql',
	'svelte',
	'toml',
	'tsx',
	'typescript',
	'vim',
	'vimdoc',
	'xml',
	'yaml',
}

local add = MiniDeps.add
local map = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

add {
	source = 'nvim-treesitter/nvim-treesitter',
	depends = { 'nvim-treesitter/nvim-treesitter-context' },
	hooks = {
		post_checkout = function()
			vim.cmd 'TSUpdate'
		end,
	},
}

require('nvim-treesitter.configs').setup {
	ensure_installed = parsers,
	auto_install = true,
	highlight = {
		enable = true,
	},
}

map('<leader>tc', '<cmd>TSContextToggle<CR>', 'Treesitter context')
-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- FIXME: add https://github.com/stsewd/sphinx.nvim
