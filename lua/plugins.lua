vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Essential setup plugins
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nathom/filetype.nvim',
    'nvim-lua/plenary.nvim',
  })
  -- Telescope Navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
    config = function ()
      require('navigation')
    end
  }
  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function ()
      require("autopairs")
    end
  }
  -- Git Signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/nvim-treesitter-refactor', opt = true },
      { 'windwp/nvim-ts-autotag', opt = true }
    },
    config = function ()
      require('treesitter')
    end
  }
  -- Lsp Integration and Completion
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'ray-x/lsp_signature.nvim' },
      { 'williamboman/nvim-lsp-installer' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'onsails/lspkind-nvim' }
    },
    config = function()
      require("lsp")
      require("completion")
      require("lsp_signature").setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded"
        }
      })
    end
  }

  -- Multipl cursors plugin
  use 'mg979/vim-visual-multi'

  -- Test Plugins
  use { 'rcarriga/vim-ultest', run = ':UpdateRemotePlugins' }
  -- Status Bar plugin
  use {
    'nvim-lualine/lualine.nvim',
    config = function ()
      require("statusbar")
    end
  }
  -- DevIcons plugin
  use 'kyazdani42/nvim-web-devicons'
  -- Colorize hex colors
  use {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require("colorizer").setup()
    end
  }
  -- Comment plugin
  use {
    'numToStr/Comment.nvim',
    config = function ()
      require("Comment").setup()
    end
  }
  -- Buffer Tabs
  use {
    'akinsho/bufferline.nvim',
    config = function ()
      require("bufferline").setup{}
    end
  }
  -- Nerdtree file sidebar
  use {
    'kyazdani42/nvim-tree.lua',
    config = function ()
      require("file_explorer")
    end
  }
  -- Debug startuptime
  use 'dstein64/vim-startuptime'
  -- Colorscheme Plugin
  use {
    'rebelot/kanagawa.nvim',
    config = function ()
      require("colorscheme")
    end
  }
end)
