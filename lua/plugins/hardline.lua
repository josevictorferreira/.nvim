local colors = {
	base00 = { gui = "#16161D", cterm = "0" },
	base01 = { gui = "#1F1F28", cterm = "18" },
	base02 = { gui = "#223249", cterm = "19" },
	base03 = { gui = "#181820", cterm = "8" },
	base04 = { gui = "#dcd7ba", cterm = "20" },
	base05 = { gui = "#716e61", cterm = "7" },
	base06 = { gui = "#8a8980", cterm = "21" },
	base07 = { gui = "#d5cea3", cterm = "15" },
	base08 = { gui = "#FFA066", cterm = "1" },
	base09 = { gui = "#cc6d00", cterm = "16" },
	base0A = { gui = "#77713f", cterm = "3" },
	base0B = { gui = "#6f894e", cterm = "2" },
	base0C = { gui = "#c7d7e0", cterm = "6" },
	base0D = { gui = "#7E9CD8", cterm = "4" },
	base0E = { gui = "#a09cac", cterm = "5" },
	base0F = { gui = "#d7474b", cterm = "17" },
}

local inactive = {
	guifg = colors.base06.gui,
	guibg = colors.base01.gui,
	ctermfg = colors.base06.cterm,
	ctermbg = colors.base01.cterm,
}

local theme = {
	mode = {
		inactive = inactive,
		normal = {
			guifg = colors.base00.gui,
			guibg = colors.base0D.gui,
			ctermfg = colors.base00.cterm,
			ctermbg = colors.base0D.cterm,
		},
		insert = {
			guifg = colors.base01.gui,
			guibg = colors.base0D.gui,
			ctermfg = colors.base01.cterm,
			ctermbg = colors.base0D.cterm,
		},
		replace = {
			guifg = colors.base00.gui,
			guibg = colors.base08.gui,
			ctermfg = colors.base00.cterm,
			ctermbg = colors.base08.cterm,
		},
		visual = {
			guifg = colors.base00.gui,
			guibg = colors.base08.gui,
			ctermfg = colors.base00.cterm,
			ctermbg = colors.base08.cterm,
		},
		command = {
			guifg = colors.base00.gui,
			guibg = colors.base08.gui,
			ctermfg = colors.base00.cterm,
			ctermbg = colors.base08.cterm,
		},
	},
	low = { --TODO
		active = {
			guifg = colors.base01.gui,
			guibg = colors.base00.gui,
			ctermfg = colors.base01.cterm,
			ctermbg = colors.base00.cterm,
		},
		inactive = inactive,
	},
	med = {
		active = {
			guifg = colors.base04.gui,
			guibg = colors.base01.gui,
			ctermfg = colors.base04.cterm,
			ctermbg = colors.base01.cterm,
		},
		inactive = inactive,
	},
	high = {
		active = {
			guifg = colors.base01.gui,
			guibg = colors.base0D.gui,
			ctermfg = colors.base01.cterm,
			ctermbg = colors.base0D.cterm,
		},
		inactive = inactive,
	},
	error = {
		active = {
			guifg = colors.base00.gui,
			guibg = colors.base08.gui,
			ctermfg = colors.base00.cterm,
			ctermbg = colors.base08.cterm,
		},
		inactive = inactive,
	},
	warning = {
		active = {
			guifg = colors.base00.gui,
			guibg = colors.base0B.gui,
			ctermfg = colors.base00.cterm,
			ctermbg = colors.base0B.cterm,
		},
		inactive = inactive,
	},
	bufferline = {
		separator = inactive,
		current = {
			guifg = colors.base00.gui,
			guibg = colors.base0D.gui,
			ctermfg = colors.base00.cterm,
			ctermbg = colors.base0D.cterm,
		},
		current_modified = {
			guifg = colors.base00.gui,
			guibg = colors.base0E.gui,
			ctermfg = colors.base00.cterm,
			ctermbg = colors.base0E.cterm,
		},
		background = {
			guifg = colors.base04.gui,
			guibg = colors.base01.gui,
			ctermfg = colors.base04.cterm,
			ctermbg = colors.base01.cterm,
		},
		background_modified = {
			guifg = colors.base0E.gui,
			guibg = colors.base01.gui,
			ctermfg = colors.base0E.cterm,
			ctermbg = colors.base01.cterm,
		},
	},
}

return {
	"ojroques/nvim-hardline",
	config = function()
		require("hardline").setup({
			bufferline = true,
			bufferline_settings = {
				exclude_terminal = false,
				show_index = false,
			},
			theme = theme,
			sections = {
				{ class = "mode", item = require("hardline.parts.mode").get_item },
				{ class = "high", item = require("hardline.parts.git").get_item, hide = 100 },
				{ class = "med", item = require("hardline.parts.filename").get_item },
				"%<",
				{ class = "med", item = "%=" },
				{ class = "low", item = require("hardline.parts.wordcount").get_item, hide = 100 },
				{ class = "error", item = require("hardline.parts.lsp").get_error },
				{ class = "warning", item = require("hardline.parts.lsp").get_warning },
				{ class = "warning", item = require("hardline.parts.whitespace").get_item },
				{ class = "high", item = require("hardline.parts.filetype").get_item, hide = 60 },
				{ class = "mode", item = require("hardline.parts.line").get_item },
			},
		})
	end,
}
