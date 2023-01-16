return {
  -- Essential setup plugins
  {
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nvim-lua/plenary.nvim',
  },
  {
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
  },
  -- Crystal language support
  { "vim-crystal/vim-crystal", ft = "cr" },
  -- Telescope Navigation
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function ()
      require('navigation')
    end
  },
  -- Autopair
  {
    'windwp/nvim-autopairs',
    config = function ()
      require("autopairs")
    end
  },
  -- Git Signs
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-refactor', lazy = true },
      { 'windwp/nvim-ts-autotag', lazy = true }
    },
    config = function ()
      require('treesitter')
    end
  },
  -- Lsp Integration and Completion
  {
    'neovim/nvim-lspconfig',
    dependencies = {
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
  },

  -- Multiple cursors
  { 'terryma/vim-multiple-cursors' },

  -- Status Bar plugin
  {
    'nvim-lualine/lualine.nvim',
    config = function ()
      require("statusbar")
    end
  },
  -- DevIcons plugin
  { 'kyazdani42/nvim-web-devicons' },
  -- Colorize hex colors
  {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require("colorizer").setup()
    end
  },
  -- Comment plugin
  {
    'numToStr/Comment.nvim',
    config = function ()
      require("Comment").setup()
    end
  },
  -- Buffer Tabs
  {
    'akinsho/bufferline.nvim',
    config = function ()
      require("bufferline").setup{}
    end
  },
  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'honza/vim-snippets'
    },
    config = function ()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require'luasnip'.filetype_extend("ruby", {"rails"})
    end
  },
  -- Nerdtree file sidebar
  {
    'kyazdani42/nvim-tree.lua',
    config = function ()
      require("file_explorer")
    end
  },
  -- Debug startuptime
  { 'dstein64/vim-startuptime', cmd = "StartupTime" },
  -- Colorscheme Plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function ()
      require("colorscheme")
    end
  },
  -- Disable relative line numbers in insert mode
  {
    'nkakouros-original/numbers.nvim',
    config = function ()
      require('numbers').setup()
    end
  },
  -- Better Markdown
  { "ellisonleao/glow.nvim", branch = 'main' },
  -- Motion
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  -- Tests
  {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  },
  -- Managing external editor tooling
  {
    'williamboman/mason.nvim',
    dependencies = {
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
}
