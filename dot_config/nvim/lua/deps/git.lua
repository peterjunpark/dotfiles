local add = MiniDeps.add

-- Git integration
add { source = 'lewis6991/gitsigns.nvim' }
require('gitsigns').setup {
	signs = {
		add = { text = '▎' },
		change = { text = '▎' },
		delete = { text = '' },
		topdelete = { text = '' },
		changedelete = { text = '▎' },
		untracked = { text = '▎' },
	},
	signs_staged = {
		add = { text = '▎' },
		change = { text = '▎' },
		delete = { text = '' },
		topdelete = { text = '' },
		changedelete = { text = '▎' },
	},
}
