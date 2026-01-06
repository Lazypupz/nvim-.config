print("Hello World") --required

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.winborder = "double"

vim.g.mapleader = " "
local map = vim.keymap.set

map('n', '<leader>pv', vim.cmd.Ex)
map('n', '<leader>o', ':update<CR> :source<CR>')
--map('t', '^[', "^\^N")
--map('t', '^O', "^\^O")

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim.git"}
})


vim.lsp.config['lua_ls'] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },

	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
}
vim.lsp.config['clangd'] = {

	cmd = { 'clangd' },

	rootmarkers = { '.clangd', 'compile_commands.json' },

	filestypes = { 'c', 'cpp' }
}

vim.lsp.config['tinymist'] = {
	cmd = {'tinymist'},

	filetypes = {'typst'},

	settings = {
		formatterMode = "typstyle"
	}
}
vim.lsp.enable({ "lua_ls", "clangd", "tinymist" })
require('config.plugins.typst-preview')
	
map('n', '<leader>lf', vim.lsp.buf.format)

vim.cmd("colorscheme darkblue")

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.cmd [[set completeopt+=menuone,noselect,popup]]
