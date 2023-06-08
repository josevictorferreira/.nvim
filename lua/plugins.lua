return {
  -- Essential setup plugins
  {
    'lewis6991/impatient.nvim',
    'nvim-lua/plenary.nvim',
  },
  -- Github Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot_config")
    end,
  },
  -- Filetype Plugin
  {
    'nathom/filetype.nvim',
    config = function()
      require("filetype").setup({
        overrides = {
          extensions = {
            cr = "crystal",
            sql = "sql",
            html = "html"
          },
        }
      })
    end
  },
  -- Crystal language support
  { "vim-crystal/vim-crystal", ft = "cr" },
  -- Ruby RBS Syntax Highlight
  { "jlcrochet/vim-rbs", ft = "rbs" },
  -- Buffers Bar
  {
    'akinsho/bufferline.nvim',
    version = 'v3.*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    priority = 1010,
    config = function ()
      require("bufferline").setup{}
    end
  },
  -- Telescope Navigation
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('navigation')
    end
  },
  -- File Browser
  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeToggle',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    version = 'nightly',
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false
        },
        git = {
          ignore = true
        }
      })
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('fold')
    end
  },
  -- Autopair
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
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
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-refactor', lazy = true },
      { 'windwp/nvim-ts-autotag', lazy = true }
    },
    config = function()
      require('treesitter')
    end
  },
  -- Lsp Integration and Completion
  {
    'neovim/nvim-lspconfig',
    event = "InsertEnter",
    dependencies = {
      { 'hrsh7th/nvim-cmp' },
      { 'ray-x/lsp_signature.nvim' },
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
  { 'terryma/vim-multiple-cursors', event = "InsertEnter" },

  -- Status Bar plugin
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 900,
    config = function()
      require("statusbar")
    end
  },
  -- Colorize hex colors
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup()
    end
  },
  -- Comment plugin
  {
    'numToStr/Comment.nvim',
    config = function()
      require("Comment").setup()
    end
  },
  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    event = 'VeryLazy',
    dependencies = {
      'honza/vim-snippets'
    },
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require 'luasnip'.filetype_extend("ruby", { "rails" })
    end
  },
  -- Debug startuptime
  { 'dstein64/vim-startuptime', cmd = "StartupTime" },
  -- Colorscheme Plugin
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorscheme")
    end
  },
  -- Disable relative line numbers in insert mode
  {
    'nkakouros-original/numbers.nvim',
    lazy = true,
    config = function()
      require('numbers').setup()
    end
  },
  -- Better Markdown
  { "ellisonleao/glow.nvim", branch = 'main', ft = 'md' },
  -- Motion
  {
    'phaazon/hop.nvim',
    lazy = true,
    branch = 'v2', -- optional but strongly recommended
    cmd = 'HopWord',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  -- Tests
  {
    "klen/nvim-test",
    lazy = true,
    config = function()
      require('nvim-test').setup()
    end
  },
  -- Managing external editor tooling
  {
    'williamboman/mason.nvim',
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
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
        ensure_installed = { "lua_ls", "rust_analyzer", "crystalline", "solargraph", "tsserver", "bashls", "dockerls", "dotls", "html" }
      })
    end
  }
}
