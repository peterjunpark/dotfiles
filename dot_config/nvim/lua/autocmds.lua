--  See `:help lua-guide-autocommands`
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('pp-highlight-on-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Turn on relative line numbers in normal mode and off in insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
	pattern = '*',
	callback = function()
		vim.wo.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
	pattern = '*',
	callback = function()
		vim.wo.relativenumber = true
	end,
})
