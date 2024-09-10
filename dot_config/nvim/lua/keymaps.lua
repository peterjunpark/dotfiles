-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>wx', '<cmd>split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<leader>wq', '<C-w><C-q>', { desc = 'Close window' })
vim.keymap.set('n', '<leader>wo', '<C-w><C-o>', { desc = 'Close all other windows' })
vim.keymap.set('n', '<leader>ww', '<C-w><C-w>', { desc = 'Switch window' })
vim.keymap.set('n', '<leader>ws', '<C-w><C-x>', { desc = 'Swap current window with next' })
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Focus upper window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Focus right window' })
