return {
	"nvim-tree/nvim-tree.lua",
	cmd = "NvimTreeToggle",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
				custom = { "node_modules", ".git", ".cache" },
				exclude = { ".github" },
			},
			view = {
				width = 40,
			},
		})
	end,
}
