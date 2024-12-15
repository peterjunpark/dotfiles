local M = {}

M.keymap = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

return M
