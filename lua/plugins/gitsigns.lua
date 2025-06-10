return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPost",
	keys = {
		{ "<leader>gh", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame" },
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
		{ "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer" },
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
		{ "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer" },
		{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Undo stage hunk" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff this" },
		{ "<leader>gD", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff this with HEAD" },
		{ "<leader>gB", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
	},
	config = function()
		require("gitsigns").setup({
			current_line_blame = false,
		})
	end,
}
