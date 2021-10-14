npairs = require('nvim-autopairs')

npairs.setup({
	map_cr = true,
	check_ts = true
})

require('nvim-autopairs.completion.cmp').setup({
	map_cr = true,
	map_complete = true,
	auto_select = true,
	insert = false,
	map_char = {
		all = '(',
		tex = '{'
	}
})

npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
