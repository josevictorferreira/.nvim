local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({function()
  -- Essential setup plugins
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nvim-lua/plenary.nvim',
  })
  use {
    'nathom/filetype.nvim',
    config = function ()
      require("filetype").setup({
        overrides = {
          extensions = {
            cr = "crystal",
          },
        }
      })
    end
  }
  -- Crystal language support
  use "vim-crystal/vim-crystal"
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
      { 'saadparwaiz1/cmp_luasnip' },
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

  -- Multiple cursors
  use 'terryma/vim-multiple-cursors'

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
  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      'honza/vim-snippets'
    },
    config = function ()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require'luasnip'.filetype_extend("ruby", {"rails"})
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
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function ()
      require("colorscheme")
    end
  })
  -- Disable relative line numbers in insert mode
  use {
    'nkakouros-original/numbers.nvim',
    config = function ()
      require('numbers').setup()
    end
  }
  -- Better Markdown
  use {"ellisonleao/glow.nvim", branch = 'main'}
  -- Motion
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  -- Tests
  use {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  }
  -- Managing external editor tooling
  use {
    'williamboman/mason.nvim',
    requires = {
      "williamboman/mason-lspconfig.nvim"
    },
    config = function ()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      require("mason-lspconfig").setup({
        ensure_installed = { "sumneko_lua", "rust_analyzer", "crystalline" }
      })
    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  profile = {
    enable = true,
    threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
  }
}}
)
