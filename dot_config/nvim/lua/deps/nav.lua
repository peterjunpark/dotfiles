local map = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

  require('mini.pick').setup()

  map('<leader>f', MiniPick.builtin.files, 'Files')
  map('<leader>g', MiniPick.builtin.grep_live, 'Grep')
  map('<leader>/h', MiniPick.builtin.help, 'Help') 
  map('<leader>/.', MiniPick.builtin.resume, 'Resume')


	require('mini.files').setup()
	map('<leader>e', MiniFiles.open, 'Explorer')
