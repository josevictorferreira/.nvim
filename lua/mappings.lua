local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, options)
end

map('v', 'J', ":m '>+1<CR>gv=gv", options)
map('v', 'K', ":m '<-2<CR>gv=gv", options)

map('n', 'YY', '"+y<CR>', options)

map('n', '<S-l>', ':bn<CR>', options)
map('n', '<S-h>', ':bp<CR>', options)
map('n', '<leader>c', ':bd!<CR>', options)

map('n', '<C-r>', ':lua RunCode()<CR>', options)
map('n', '<C-p>', ':lua PrettierFormat()<CR>', options)

map('n', '<leader>l', ':lua vim.lsp.buf.format({ async = true })<CR>', options)

-- SPLIT BUFFERS
map('n', '<leader>sh', ':leftabove vsplit<CR>', options)
map('n', '<leader>sl', ':rightbelow vsplit<CR>', options)
map('n', '<leader>sk', ':leftabove split<CR>', options)
map('n', '<leader>sj', ':rightbelow split<CR>', options)

map('n', '<C-j>', '<C-w>j', options)
map('n', '<C-k>', '<C-w>k', options)
map('n', '<C-l>', '<C-w>l', options)
map('n', '<C-h>', '<C-w>h', options)

map('n', '<leader>,', ':noh<CR>', options)
nmap('gd', vim.lsp.buf.definition)
nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

-- Telescope
map('n', '<leader>p', ':Telescope find_files<CR>', options)
map('n', '<leader>fg', ':Telescope live_grep<CR>', options)
map('n', '<leader>f', ':Telescope live_grep<CR>', options)
map('n', '<leader>fb', ':Telescope buffers<CR>', options)
map('n', '<leader>fh', ':Telescope help_tags<CR>', options)
--map('n', '<leader><tab>', ':NvimTreeToggle<CR>', options)
map('n', '<leader><tab>', ':edit .<CR>', options)
-- Motion
map('n', 'f', ":HopWord<CR>", options)

map('n', '<leader>jl', ':%!jq .<CR>', options)
