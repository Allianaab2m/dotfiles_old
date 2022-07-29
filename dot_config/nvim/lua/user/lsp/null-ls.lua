local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
local sources = {
  null_ls.builtins.diagnostics.eslint_d.with({
    diagnostics_postprocess = function(diagnostic)
      diagnostic.severty = vim.diagnostic.severity["WARN"]
    end,
    condition = function()
      return vim.fn.executable('eslint_d') > 0
    end
  })
}
null_ls.setup (
  {
    sources = sources
  }
)
