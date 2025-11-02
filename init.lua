print("Hello World")
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

--vim.cmd [[hi @function.builtin.lua guifg=red]]

vim.g.mapleader = " "
local map = vim.keymap.set
map('n', '<leader>pv', vim.cmd.Ex)
vim.lsp.enable({
    "lua_ls", "clangd", "ruff", "gopls"
})
