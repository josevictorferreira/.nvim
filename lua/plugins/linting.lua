return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile", "BufWritePost" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			nix = { "deadnix", "statix" },
		}
		local deadnix = lint.linters.deadnix
		local original_deadnix_parser = deadnix.parser
		deadnix.parser = function(output, bufnr, linter_cwd)
			local diagnostics = original_deadnix_parser(output, bufnr, linter_cwd)
			for _, diagnostic in ipairs(diagnostics) do
				diagnostic.source = "deadnix"
			end
			return diagnostics
		end

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
