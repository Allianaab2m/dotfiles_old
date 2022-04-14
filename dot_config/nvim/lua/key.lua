-- template --
-- vim.keymap.set(
--  "i(nput),n(ormal),v(isual)",
--  "設定したいキー",
--  "動作するキー", { noremap = boolean, silent = boolean}

vim.g.mapleader = ' '
-- 無いと死ぬ --
vim.api.nvim_set_keymap(
  "i",
  "jj",
  "<Esc>", { noremap = true, silent = true }
)

-- Emacs like Keybind --
vim.keymap.set(
  "i",
  "<C-p>",
  "<Up>"
)

vim.keymap.set(
  "i",
  "<C-n>",
  "<Down>"
)

vim.keymap.set(
  "i",
  "<C-b>",
  "<Left>"
)

vim.keymap.set(
  "i",
  "<C-f>",
  "<Right>"
)

-- window movement --
vim.api.nvim_set_keymap(
  "n",
  "sj",
  [[<C-w>j]], { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "sk",
  [[<C-w>k]], { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "sh",
  [[<C-w>h]], { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "sl",
  [[<C-w>l]], { noremap = true }
)

-- window separate --
vim.api.nvim_set_keymap(
  "n",
  "ss",
  [[:<C-u>sp<CR><C-w>j]], { noremap = true }
)

vim.api.nvim_set_keymap(
  "n",
  "sv",
  [[:<C-u>vs<CR><C-w>l]], { noremap = true }
)

-- Trouble --
vim.keymap.set(
  "n",
  "<Leader>xx",
  "<cmd>Trouble<CR>", { silent = true, noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>xw",
  "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>xd",
  "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>xl",
  "<cmd>Trouble loclist<cr>", { silent = true, noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>xq",
  "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true }
)

vim.keymap.set(
  "n",
  "gR",
  "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true }
)

-- Fuzzy Finder --
vim.keymap.set(
  "n",
  "<Leader>ff",
  "<cmd>Telescope find_files<cr>", { noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>fg",
  "<cmd>Telescope live_grep<cr>", { noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>fb",
  "<cmd>Telescope buffers<cr>", { noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>fh",
  "<cmd>Telescope help_tags<cr>", { noremap = true }
)

vim.keymap.set(
  "n",
  "<Leader>fgh",
  "<cmd>Telescope gh issues<cr>"
)

-- Trouble & Telescope --
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<C-t>"] = trouble.open_with_trouble },
      n = { ["<C-t>"] = trouble.open_with_trouble },
    }
  }
}

