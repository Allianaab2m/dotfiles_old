local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local isNvimtree = function()
  return vim.bo.filetype ~= 'NvimTree'
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = true,
  always_visible = true,
  cond = hide_in_width
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  colored = true,
  icons_enabled = true,
  cond = isNvimtree
}

local location = {
  "location",
  padding = 0,
}

local lsp = {
  function(msg)
    msg = msg or "LSP Inactive"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      if type(msg) == "boolean" or #msg == 0 then
        return "LSP Inactive"
      end
      return msg
    end
    local buf_client_names = {}

    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end

    local unique_client_names = vim.fn.uniq(buf_client_names)
    return table.concat(unique_client_names, ", ")
  end,
  cond = hide_in_width
}

local encoding = {
  "encoding",
  cond = hide_in_width
}

-- local spaces = function()
  -- return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {"branch"},
    lualine_c = { diagnostics, diff },
    lualine_x = { lsp, encoding, filetype },
    lualine_y = { location },
    lualine_z = { "progress" },
  },
}
