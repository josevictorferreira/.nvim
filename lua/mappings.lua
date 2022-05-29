local g = vim.g
local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

g.mapleader = ' '

map('v', 'J', ":m '>+1<CR>gv=gv", options)
map('v', 'K', ":m '<-2<CR>gv=gv", options)

map('n', 'YY', '"+y<CR>', options)

map('n', '<S-l>', ':bn<CR>', options)
map('n', '<S-h>', ':bp<CR>', options)
map('n', '<leader>c', ':bd!<CR>', options)

map('n', '<C-r>', ':lua RunCode()<CR>', options)

map('n', '<leader>l', ':lua vim.lsp.buf.formatting()<CR>', options)

map('n', '<leader>s<left>', ':leftabove vsplit<CR>', options)
map('n', '<leader>s<right>', ':rightbelow vsplit<CR>', options)
map('n', '<leader>s<up>', ':leftabove split<CR>', options)
map('n', '<leader>s<down>', ':rightbelow split<CR>', options)

map('n', '<C-j>', '<C-w>j', options)
map('n', '<C-k>', '<C-w>k', options)
map('n', '<C-l>', '<C-w>l', options)
map('n', '<C-h>', '<C-w>h', options)

map('n', '<leader>sh', ':terminal<CR>', options)

map('n', '<leader>,', ':noh<CR>', options)

map('n', '<leader><tab>', ':NvimTreeToggle<CR>', options)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', options)

-- VimTest
map('n', 't<C-n>', ':TestNearest<CR>', options)
map('n', 't<C-f>', ':TestFile<CR>', options)
map('n', 't<C-s>', ':TestSuite<CR>', options)
map('n', 't<C-l>', ':TestLast<CR>', options)
map('n', 't<C-g>', ':TestVisit<CR>', options)

-- Ultest
map('n', '<leader><C-t>', ':UltestSummary!<CR>', options)
map('n', '<leader>t', ':UltestNearest<CR>', options)
map('n', '<leader>T', ':Ultest<CR>', options)

-- Telescope
map('n', '<leader>p', ':Telescope find_files<CR>', options)
map('n', '<leader>fg', ':Telescope live_grep<CR>', options)
map('n', '<leader>f', ':Telescope live_grep<CR>', options)
map('n', '<leader>fb', ':Telescope buffers<CR>', options)
map('n', '<leader>fh', ':Telescope help_tags<CR>', options)


-- Trouble
map('n', '<leader>xx', ':TroubleToggle<CR>', options)
map('n', '<leader>xw', ':TroubleToggle workspace_diagnostics<CR>', options)
map('n', '<leader>xd', ':TroubleToggle document_diagnostics<CR>', options)
map('n', '<leader>xq', ':TroubleToggle quickfix<CR>', options)
map('n', '<leader>xl', ':TroubleToggle loclist<CR>', options)
map('n', 'gR', ':ToubleToggle lsp_references<CR>', options)


























