local path_to_elixirls = vim.fn.expand("/usr/bin/elixir-ls")

local lspconfig = require('lspconfig')
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  filetypes = { "rs" }
}

lspconfig.gopls.setup {
  capabilities = capabilities,
  filetypes = { "go" }
}

lspconfig.dotls.setup {
  capabilities = capabilities,
  filetypes = { "dot" }
}

lspconfig.crystalline.setup {
  capabilities = capabilities,
  filetypes = { "crystal", "cr" }
}

lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue" }
}

lspconfig.bashls.setup {
  capabilities = capabilities,
  filetypes = { "sh" }
}

lspconfig.pyright.setup {
  capabilities = capabilities,
  filetypes = { "python" }
}

lspconfig.solargraph.setup {
  capabilities = capabilities,
  filetypes = { "ruby" }
}
--
-- lspconfig.typeprof.setup{
--   capabilities = capabilities,
--   filetypes = { "ruby", "rbs" }
-- }

lspconfig.bufls.setup {
  capabilities = capabilities,
  filetypes = { "proto", "protobuf" }
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
  filetypes = { "json" }
}

lspconfig.yamlls.setup {
  capabilities = capabilities,
  filetypes = { "yaml", "yml" },
  on_attach = function(client)
    client.server_capabilities.document_formatting = true
  end,
  settings = {
    yaml = {
      schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/vscode-kubernetes-tools/vscode-kubernetes-tools/master/syntaxes/helm.tmLanguage.json"] = "/*.helm.yaml",
        ['https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.9.json'] = '/docker-compose.yml',
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml"
        },
    },
  }
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'use' }
      }
    }
  }
}

lspconfig.html.setup {
  capabilities = capabilities,
  filetypes = { "html" }
}

lspconfig.dockerls.setup {
  capabilities = capabilities,
  filetypes = { "dockerfile" }
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

lspconfig.eslint.setup {
  capabilities = capabilities,
  filetypes = { "javascript", "vue" }
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  filetypes = { "typescript", "javascript" }
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
