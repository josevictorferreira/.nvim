local parsers = {
	"core",
	"stable",
	"bash",
	"c",
	"cpp",
	"css",
	"diff",
	"dockerfile",
	"git_config",
	"git_rebase",
	"go",
	"html",
	"javascript",
	"json",
	"json5",
	"jsonc",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"ruby",
	"rust",
	"scss",
	"sql",
	"toml",
	"tsx",
	"typescript",
	"vimdoc",
	"yaml",
	"gleam",
	"nix",
	"elixir",
	"helm",
	"gotmpl",
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	lazy = false,
	config = function()
		require("nvim-treesitter").install(parsers)
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
			ensure_installed = parsers,
			sync_isntall = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = parsers,
			callback = function()
				vim.treesitter.start()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.opt.shiftwidth = 2
				vim.opt.tabstop = 2
				vim.opt.softtabstop = 2
				vim.opt.expandtab = true
			end,
		})
	end,
}
