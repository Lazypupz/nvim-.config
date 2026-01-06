map = vim.keymap.set
require("typst-preview").setup { 
	debug = false,
	open_cmd = nil,
	port = 0,

	host = '127.0.0.1',
	invert_colors = 'never',

	extra_args = nil,

	follow_cursor = false,

	dependicies = {
		['tinymist'] = "/usr/bin",
		['websocat'] = nil
	},
	
	map('n', '<leader>p', ":TypstPreview document")
}
