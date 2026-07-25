local parsers = {
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
	"lua",
	"luau",
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
			sync_install = false,
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

		local ts_diag_ns = vim.api.nvim_create_namespace("treesitter_errors")

		local function collect_parser_errors(bufnr, parser)
			local errors = {}
			local function traverse(node)
				local node_type = node:type()
				if node_type:match("ERROR") or node_type:match("MISSING") then
					local row, col, end_row, end_col = node:range()
					table.insert(errors, {
						bufnr = bufnr,
						lnum = row,
						end_lnum = end_row,
						col = col,
						end_col = end_col,
						severity = vim.diagnostic.severity.ERROR,
						message = "Treesitter " .. node_type:gsub("_", " "):lower(),
						source = "treesitter",
					})
				end
				for child in node:iter_children() do
					traverse(child)
				end
			end
			for _, tree in ipairs(parser:trees()) do
				traverse(tree:root())
			end
			return errors
		end

		local function update_treesitter_diagnostics()
			local bufnr = vim.api.nvim_get_current_buf()
			local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
			local ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
			if not ok or not parser then
				return
			end
			local ok2, errors = pcall(collect_parser_errors, bufnr, parser)
			if not ok2 then
				return
			end
			vim.diagnostic.set(ts_diag_ns, bufnr, errors)
		end

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "FileType" }, {
			callback = update_treesitter_diagnostics,
		})

		-- Run once for the buffer that triggered plugin load.
		vim.defer_fn(update_treesitter_diagnostics, 100)

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
