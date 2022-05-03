vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nathom/filetype.nvim',
    'nvim-lua/plenary.nvim',
  })

  use 'nvim-telescope/telescope.nvim'
  use 'lambdalisue/nerdfont.vim'
  use 'tpope/vim-fugitive'
  use 'windwp/nvim-autopairs'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'windwp/nvim-ts-autotag'
  use 'ray-x/lsp_signature.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'terryma/vim-multiple-cursors'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'dcampos/nvim-snippy'
  use 'honza/vim-snippets'
  use 'dcampos/cmp-snippy'
  use 'hrsh7th/cmp-path'
  use 'rafamadriz/friendly-snippets'
  use 'joukevandermaas/vim-ember-hbs'
  use 'onsails/lspkind-nvim'
  use 'folke/tokyonight.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'vim-crystal/vim-crystal'
  use 'rafamadriz/neon'
  use 'vim-test/vim-test'
  use { 'rcarriga/vim-ultest', run = ':UpdateRemotePlugins' }
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/trouble.nvim'
  use 'numToStr/Comment.nvim'
  use 'akinsho/bufferline.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'dstein64/vim-startuptime'
  use 'rebelot/kanagawa.nvim'
end)
