local nvim_lsp = require("lspconfig")
return {
  settings = {
    tsserver = {
      root_dir = nvim_lsp.util.root_pattern("package.json", "node_modules")
    }
  }
}
