return {
    {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.8',
	dependicies = {
	    'nvim-lua/plenary.nvim',
	    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
	    vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
	    vim.keymap.set("n", "<leader>en", function()
		require('telescope.builtin').find_files {
		    def = vim.fn.stdpath("config")
		}
	    end)
	    vim.keymap.set("n", "<leader>m", require('telescope.builtin').Man) 
	end
    }
}
