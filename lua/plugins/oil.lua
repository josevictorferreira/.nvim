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
		require("oil").setup({
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					local hidden_folders = {
						[".."] = true,
						[".ruby-lsp"] = true,
						[".git"] = true,
						[".bundle"] = true,
						["node_modules"] = true,
						["dist"] = true,
						[".DS_Store"] = true,
					}
					return hidden_folders[name] or false
				end,
			},
			lsp_file_methods = {
				enabled = false,
			},
		})
		set_oil_keymap()
	end,
}
