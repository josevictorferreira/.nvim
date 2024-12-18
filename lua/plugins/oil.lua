local set_oil_keymap = function()
	local map = vim.api.nvim_set_keymap
	local options = { noremap = true, silent = true }

	map("n", "-", ":Oil<CR>", options)
	map("n", "<leader>o", ":Oil<CR>", options)
	map("n", "<leader><tab>", ":Oil<CR>", options)
end

return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({})
		set_oil_keymap()
	end,
}
