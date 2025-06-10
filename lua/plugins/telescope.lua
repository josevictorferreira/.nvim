return {
	"nvim-telescope/telescope.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "nvim-telescope/telescope-fzf-native.nvim", lazy = true, build = "make" },
	},
	tag = "0.1.8",
	keys = {
		{ "<leader>p", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "target", ".git", ".cache" },
				set_env = { ["COLORTERM"] = "truecolor" },
				layout_strategy = "vertical",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				layout_config = {
					horizontal = {
						width = 0.9,
						height = 0.9,
						prompt_position = "bottom",
						preview_cutoff = 120,
						preview_width = 75,
						horizontal = { mirror = false },
						vertical = { mirror = false },
					},
				},
				color_devicons = true,
				use_less = true,
				find_command = {
					"rg",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
			},
			extensions = {
				wrap_results = true,
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
	end,
}
