local path_to_elixirls = vim.fn.expand("/usr/bin/elixir-ls")

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities
}

lspconfig.gopls.setup {
  capabilities = capabilities
}

lspconfig.dotls.setup {
  capabilities = capabilities
}

lspconfig.crystalline.setup {
  capabilities = capabilities,
  filetypes = { "crystal", "cr" }
}

lspconfig.bashls.setup {
  capabilities = capabilities
}

lspconfig.pyright.setup {
  capabilities = capabilities
}

lspconfig.solargraph.setup {
  capabilities = capabilities
}

lspconfig.jsonls.setup {
  capabilities = capabilities
}

lspconfig.yamlls.setup {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = true
  end,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ['https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.9.json'] = '/docker-compose.yml',
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml"
      },
    },
  }
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      }
    }
  }
}

lspconfig.html.setup {
  capabilities = capabilities
}

lspconfig.dockerls.setup {
  capabilities = capabilities
}

lspconfig.volar.setup {
  capabilities = capabilities,
  filetypes = { "vue" }
}

lspconfig.elixirls.setup {
  cmd = { path_to_elixirls },
  capabilities = capabilities,
  filetypes = { "elixir" },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false
    }
  }
}

lspconfig.efm.setup {
  capabilities = capabilities,
  filetypes = { "elixir" }
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  filetypes = { "javascript", "vue" }
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  filetypes = { "typescript" }
}

lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  filetypes = { "vue", "html" }
}

require('lspkind').init({
  mode = 'symbol_text',
  preset = 'codicons',
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
  },
})

local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufReadPre" },
  {
    callback = function()
      local ok, stats = pcall(
        vim.loop.fs_stat,
        vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
      )
      if ok and stats and (stats.size > 1000000) then
        vim.b.large_buf = true
        vim.cmd("syntax off")
        vim.cmd("Copilot disable") -- disable copilot.nvim
        vim.opt_local.foldmethod = "manual"
        vim.opt_local.spell = false
      else
        vim.b.large_buf = false
      end
    end,
    group = aug,
    pattern = "*",
  }
)
