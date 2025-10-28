return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local current_time = tonumber(vim.fn.strftime("%H"))
		if current_time < 6 then
			vim.opt.background = "dark"
			vim.cmd.colorscheme("onedark")
		elseif current_time < 12 then
			vim.opt.background = "light"
			vim.cmd.colorscheme("onelight")
		else
			vim.opt.background = "dark"
			vim.cmd.colorscheme("onedark")
		end
	end,
}
