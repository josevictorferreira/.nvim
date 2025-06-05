vim.api.nvim_create_autocmd("BufReadPre", {
	callback = function(args)
		local size = vim.fn.getfsize(args.file)
		if size > 10 * 1024 * 1024 then -- e.g., 10 MB
			local bufnr = args.buf

			-- Stop treesitter
			pcall(vim.treesitter.stop, bufnr)

			-- Disable syntax
			vim.api.nvim_buf_call(bufnr, function()
				vim.cmd("syntax off")
			end)

			-- Filetype and indent
			vim.bo[bufnr].filetype = ""
			vim.bo[bufnr].syntax = ""
			vim.bo[bufnr].indentexpr = ""
			vim.bo[bufnr].indentkeys = ""

			-- Folding
			vim.bo[bufnr].foldmethod = "manual"
			vim.bo[bufnr].foldenable = false

			-- UI/behavior
			vim.o.lazyredraw = true
			vim.o.incsearch = false
			vim.o.hlsearch = false
		end
	end,
})
