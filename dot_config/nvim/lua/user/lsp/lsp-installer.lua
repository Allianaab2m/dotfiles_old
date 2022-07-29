local status_ok, lsp_installer = pcall(require, "mason")
if not status_ok then
  return
end

local conf_status_ok, lspconf = pcall(require, "lspconfig")
if not conf_status_ok then
  return
end

local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "denols",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
}

lsp_installer.setup()

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup_handlers({function(server_name)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities
  }
  lspconf[server_name].setup(opts)
end
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "denols" then
    opts.root_dir = lspconf.util.root_pattern("deno.json", "deps.ts", "deno.jsonc", "import_map.json")
    opts.init_options = {
      lint = true,
      unstable = true,
      suggest = {
        imports = {
          hosts = {
            ["https://deno.land"] = true,
            ["https://cdn.nest.land"] = true,
            ["https://crux.land"] = true
          }
        }
      }
    }
  end

  if server == "tsserver" then
    opts.root_dir = lspconf.util.root_pattern("node_modules", "package.json")
  end

  lspconfig[server].setup(opts)
end
