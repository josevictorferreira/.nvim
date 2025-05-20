vim.g.mapleader = " "

local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

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

map("n", "<C-w>H", ":vertical resize -5<CR>", options)
map("n", "<C-w>L", ":vertical resize +5<CR>", options)
map("n", "<C-w>K", ":resize -2<CR>", options)
map("n", "<C-w>J", ":resize +2<CR>", options)

map("n", "<leader>,", ":noh<CR>", options)

vim.keymap.set("n", "<leader>r", function()
	print("Resize mode: h/l = width, j/k = height. Press q to quit.")
	local resize_keys = {
		h = ":vertical resize -2<CR>",
		l = ":vertical resize +2<CR>",
		j = ":resize -2<CR>",
		k = ":resize +2<CR>",
		q = nil,
	}

	local function resize_loop()
		vim.fn.getcharstr()
		local key = vim.fn.nr2char(vim.fn.getchar(0))
		print("Key pressed: " .. key)
		local cmd = resize_keys[key]
		if key == "q" then
			print("Exiting resize mode.")
			return
		end
		if cmd then
			vim.cmd(cmd)
			resize_loop()
		end
	end

	resize_loop()
end)
