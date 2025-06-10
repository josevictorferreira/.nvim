return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open Oil" },
		{ "<leader>o", "<cmd>Oil<cr>", desc = "Open Oil" },
		{ "<leader><tab>", "<cmd>Oil<cr>", desc = "Open Oil" },
	},
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
	end,
}
