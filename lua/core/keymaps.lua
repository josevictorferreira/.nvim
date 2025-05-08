vim.g.mapleader = " "

local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, options)
end

map("v", "J", ":m '>+1<CR>gv=gv", options)
map("v", "K", ":m '<-2<CR>gv=gv", options)

map("n", "YY", '"+y<CR>', options)

map("n", "<S-l>", ":bn<CR>", options)
map("n", "<S-h>", ":bp<CR>", options)
map("n", "<leader>c", ":bd!<CR>", options)

map("n", "<C-r>", ":lua RunCode()<CR>", options)

map("n", "<leader>l", ":lua vim.lsp.buf.format({ async = true })<CR>", options)

map("n", "<leader>sh", ":leftabove vsplit<CR>", options)
map("n", "<leader>sl", ":rightbelow vsplit<CR>", options)
map("n", "<leader>sk", ":leftabove split<CR>", options)
map("n", "<leader>sj", ":rightbelow split<CR>", options)

map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)
map("n", "<C-h>", "<C-w>h", options)

map("n", "<leader>,", ":noh<CR>", options)
nmap("gd", vim.lsp.buf.definition)
nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

map("n", "<leader>jl", ":%!jq .<CR>", options)

map("v", "<leader>r", ":lua ReplaceAllFromSelectedText()<CR>", options)

map("v", "<leader>rp", ":lua ProjectSearchAndReplace()<CR>", options)
