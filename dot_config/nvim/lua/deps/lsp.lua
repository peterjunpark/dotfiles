local add = MiniDeps.add

add {
	source = 'folke/lazydev.nvim',
	depends = {
		'Bilal2453/luvit-meta',
	},
}

require('lazydev').setup {
	library = {
		{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
	},
}

add {
	source = 'elixir-tools/elixir-tools.nvim',
	depends = {
		'nvim-lua/plenary.nvim',
	},
}

local elixir = require 'elixir'
local elixirls = require 'elixir.elixirls'

elixir.setup {
	nextls = { enable = true },
	elixirls = {
		enable = true,
		settings = elixirls.settings {
			dialyzerEnabled = false,
			enableTestLenses = false,
		},
		-- on_attach = function(client, bufnr)
		-- 	vim.keymap.set('n', '<>ap', ':ElixirFromPipe<cr>', { buffer = true, noremap = true })
		-- 	vim.keymap.set('n', '<space>tp', ':ElixirToPipe<cr>', { buffer = true, noremap = true })
		-- 	vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
		-- end,
	},
	projectionist = {
		enable = true,
	},
}

add {
	source = 'neovim/nvim-lspconfig',
	depends = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		-- 'hrsh7th/cmp-nvim-lsp',
	},
}
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('pp-lsp-attach', { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end
		--
		-- -- Jump to the definition of the word under your cursor.
		-- --  This is where a variable was first declared, or where a function is defined, etc.
		-- --  To jump back, press <C-t>.
		-- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		--
		-- -- Find references for the word under your cursor.
		-- map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		--
		-- -- Jump to the implementation of the word under your cursor.
		-- --  Useful when your language has ways of declaring types without an actual implementation.
		-- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
		--
		-- -- Jump to the type of the word under your cursor.
		-- --  Useful when you're not sure what type a variable is and you want to see
		-- --  the definition of its *type*, not where it was *defined*.
		-- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
		--
		-- -- Fuzzy find all the symbols in your current document.
		-- --  Symbols are things like variables, functions, types, etc.
		-- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
		--
		-- -- Fuzzy find all the symbols in your current workspace.
		-- --  Similar to document symbols, except searches over your entire project.
		-- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
		--
		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		map('<leader>r', vim.lsp.buf.rename, 'Rename')

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map('<leader>a', vim.lsp.buf.code_action, 'Code action', { 'n', 'x' })

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup('pp-lsp-highlight', { clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('pp-lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'pp-lsp-highlight', buffer = event2.buf }
				end,
			})
		end

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		--
		-- This may be unwanted, since they displace some of your code
		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			map('<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, 'Inlay hints')
		end
	end,
})

-- LSP servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the LSP specification.
--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. Available keys are:
--  - cmd (table): Override the default command used to start the server
--  - filetypes (table): Override the default list of associated filetypes for the server
--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
--  - settings (table): Override the default settings passed when initializing the server.
--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
local servers = {
	clangd = {},
	esbonio = {},
	gopls = {
		settings = {
			gopls = {
				gofumpt = true,
			},
		},
	},
	ts_ls = {},
	pyright = {},
	-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
	lua_ls = {
		-- cmd = {...},
		-- filetypes = { ...},
		-- capabilities = {},
		settings = {
			Lua = {
				completion = {
					callSnippet = 'Replace',
				},
				-- Ignore Lua_LS's noisy `missing-fields` warnings
				diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
	ols = {},
}

-- Ensure the servers and tools above are installed
--  To check the current status of installed tools and/or manually install
--  other tools, you can run
--    :Mason
--
--  You can press `g?` for help in this menu.
require('mason').setup()

-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	'gofumpt', -- Stricter gofmt
	'goimports', -- Sort imports in Go files
	'stylua', -- Used to format Lua code
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- This handles overriding only values explicitly passed
			-- by the server configuration above. Useful when disabling
			-- certain features of an LSP (for example, turning off formatting for tsserver)
			-- server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			require('lspconfig')[server_name].setup(server)
		end,
	},
}

-- return { -- Autocompletion
--   'hrsh7th/nvim-cmp',
--   event = 'InsertEnter',
--   dependencies = {
--     -- Snippet Engine & its associated nvim-cmp source
--     {
--       'L3MON4D3/LuaSnip',
--       build = (function()
--         -- Build Step is needed for regex support in snippets.
--         -- This step is not supported in many windows environments.
--         -- Remove the below condition to re-enable on windows.
--         if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
--           return
--         end
--         return 'make install_jsregexp'
--       end)(),
--       dependencies = {
--         -- `friendly-snippets` contains a variety of premade snippets.
--         --    See the README about individual language/framework/plugin snippets:
--         --    https://github.com/rafamadriz/friendly-snippets
--         -- {
--         --   'rafamadriz/friendly-snippets',
--         --   config = function()
--         --     require('luasnip.loaders.from_vscode').lazy_load()
--         --   end,
--         -- },
--       },
--     },
--     'saadparwaiz1/cmp_luasnip',
--
--     -- Adds other completion capabilities.
--     --  nvim-cmp does not ship with all sources by default. They are split
--     --  into multiple repos for maintenance purposes.
--     'hrsh7th/cmp-nvim-lsp',
--     'hrsh7th/cmp-path',
--   },
--   config = function()
--     -- See `:help cmp`
--     local cmp = require 'cmp'
--     local luasnip = require 'luasnip'
--     luasnip.config.setup {}
--
--     cmp.setup {
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       completion = { completeopt = 'menu,menuone,noinsert' },
--
--       -- For an understanding of why these mappings were
--       -- chosen, you will need to read `:help ins-completion`
--       --
--       -- No, but seriously. Please read `:help ins-completion`, it is really good!
--       mapping = cmp.mapping.preset.insert {
--         -- Select the [n]ext item
--         ['<C-n>'] = cmp.mapping.select_next_item(),
--         -- Select the [p]revious item
--         ['<C-p>'] = cmp.mapping.select_prev_item(),
--
--         -- Scroll the documentation window [b]ack / [f]orward
--         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--
--         -- Accept ([y]es) the completion.
--         --  This will auto-import if your LSP supports it.
--         --  This will expand snippets if the LSP sent a snippet.
--         ['<C-y>'] = cmp.mapping.confirm { select = true },
--
--         -- Manually trigger a completion from nvim-cmp.
--         --  Generally you don't need this, because nvim-cmp will display
--         --  completions whenever it has completion options available.
--         ['<C-Space>'] = cmp.mapping.complete {},
--
--         -- Think of <c-l> as moving to the right of your snippet expansion.
--         --  So if you have a snippet that's like:
--         --  function $name($args)
--         --    $body
--         --  end
--         --
--         -- <c-l> will move you to the right of each of the expansion locations.
--         -- <c-h> is similar, except moving you backwards.
--         ['<C-l>'] = cmp.mapping(function()
--           if luasnip.expand_or_locally_jumpable() then
--             luasnip.expand_or_jump()
--           end
--         end, { 'i', 's' }),
--         ['<C-h>'] = cmp.mapping(function()
--           if luasnip.locally_jumpable(-1) then
--             luasnip.jump(-1)
--           end
--         end, { 'i', 's' }),
--
--         -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--         --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--       },
--       sources = {
--         {
--           name = 'lazydev',
--           -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
--           group_index = 0,
--         },
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--         { name = 'path' },
--       },
--     }
--   end,
-- }
