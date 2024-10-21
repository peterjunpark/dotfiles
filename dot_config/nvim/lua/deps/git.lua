local add, now = MiniDeps.add, MiniDeps.now

now(function()
	require('mini.git').setup()
	require('mini.diff').setup()
end)
