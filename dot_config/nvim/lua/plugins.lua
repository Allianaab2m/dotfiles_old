vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function ()
  -- Library --
  use {
    'nvim-lua/popup.nvim'
  }

  use {
    'nvim-lua/plenary.nvim'
  }

  use {
    'MunifTanjim/nui.nvim'
  }

  use {
    'rcarriga/nvim-notify'
  }

  use {
    'vim-denops/denops.vim'
  }

  -- LSP --
  use {
    'neovim/nvim-lspconfig',
  }

  use {
    'williamboman/nvim-lsp-installer'
  }

  use {
    'tamago324/nlsp-settings.nvim'
  }

  -- LSP UI --
  use {
    'tami5/lspsaga.nvim'
  }

  use {
    'ray-x/lsp_signature.nvim'
  }

  use {
    'folke/lsp-colors.nvim'
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require("trouble").setup {
      }
    end
  }

  use {
    'j-hui/fidget.nvim'
  }

  -- Completion --
  use {
    'hrsh7th/nvim-cmp'
  }

  use {
    'onsails/lspkind-nvim'
  }

  use {
    'hrsh7th/cmp-nvim-lsp'
  }

  use {
    'hrsh7th/cmp-nvim-lsp-signature-help'
  }

  use {
    'hrsh7th/cmp-nvim-lsp-document-symbol'
  }

  use {
    'hrsh7th/cmp-buffer'
  }

  use {
    'hrsh7th/cmp-path'
  }

  use {
    'hrsh7th/cmp-nvim-lua'
  }

  -- Snip --
  use {
    'saadparwaiz1/cmp_luasnip'
  }

  use {
    'L3MON4D3/LuaSnip'
  }

  -- Statusline --
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use {
    'SmiteshP/nvim-gps'
  }

  -- BufferLine --
  use {
    'akinsho/bufferline.nvim'
  }

  -- Layout --
  use {
    'myusuf3/numbers.vim'
  }

  -- Sidebar --
  use {
    'sidebar-nvim/sidebar.nvim'
  }

  -- Scrollbar --
  use {
    'petertriho/nvim-scrollbar'
  }

  -- Icon --
  use {
    'kyazdani42/nvim-web-devicons'
  }

  -- ColorScheme --
  use {
    'EdenEast/nightfox.nvim',
    config = vim.cmd("colorscheme nordfox")
  }

  -- Fuzzy Finder --
  use {
    'nvim-telescope/telescope.nvim'
  }

  use {
    'nvim-telescope/telescope-frecency.nvim' }
  use {
    'nvim-telescope/telescope-packer.nvim'
  }

  use {
    'nvim-telescope/telescope-github.nvim'
  }

  -- Tree Sitter --
  use {
    'nvim-treesitter/nvim-treesitter'
  }

  use {
    'JoosepAlviste/nvim-ts-context-commentstring'
  }

  use {
    'haringsrob/nvim_context_vt'
  }

  use {
    'm-demare/hlargs.nvim'
  }

  -- Key --
  use {
    'folke/which-key.nvim',
  }

  -- Easy Motion --
  use {
    'phaazon/hop.nvim'
  }

  -- Util --
  use {
    'segeljakt/vim-silicon'
  }

  use {
    'jiangmiao/auto-pairs'
  }

  use {
    'lukas-reineke/indent-blankline.nvim'
  }

  -- Git --
  use {
    'TimUntersberger/neogit'
  }

  use {
    'lewis6991/gitsigns.nvim'
  }

  -- Twitter --
  use {
    'twitvim/twitvim'
  }

  use {
    'xiyaowong/nvim-transparent'
  }

  -- Fcitx --
  use {
    'h-hg/fcitx.nvim'
  }

  -- fun --
  use {
    'Allianaab2m/diceroll.vim'
  }

  -- Highlight --
  use {
    'wadackel/nvim-syntax-info'
  }

  -- Docker --
  use {
    'jamestthompson3/nvim-remote-containers'
  }

end)

-- Luasnip setting --
local luasnip = require 'luasnip'

-- Add capabilities --
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities

local lspconfig = require('lspconfig')

-- No Virtual Text Error --
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- Bufferline Setup --
vim.opt.termguicolors = true
require('bufferline').setup{
  options = {
    separator_style = "slant",
    numbers = "buffer_id",
    show_buffer_close_icons = false
  }
}

-- Completion Setup--
local lspkind = require('lspkind')
local cmp = require 'cmp'
cmp.setup {
  snippet = { expand = function() end},
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.expand_or_jumpable(-1) then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { max_item_count = 7 }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  }
}

-- lualine --
local colors = {
  red = '#BF616A',
  grey = '#4C566A',
  black = '#2E3440',
  white = '#D8DEE9',
  light_green = '#A3BE8C',
  orange = '#D08770',
  green = '#A3BE8C',
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.black, bg = colors.black } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon=''},
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}

local fidget = require 'fidget'
fidget.setup{}

-- Telescope Setup --
require('telescope').load_extension('gh')
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    }
  }
}

-- Treesitter Setup --
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = {
      'ruby',
      'toml',
      'c_sharp',
      'vue',
    }
  },
  indent = {
    enable = true,
  }
}

-- hop setup --
require('hop').setup {
  keys = 'etovxqpdygfblzhckisuran'
}

-- indent blankline setup
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require('indent_blankline').setup{
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  space_char_blankline = " ",
}

-- which key --
local whichkey = require('which-key')
local conf = {
  window = {
    border = "single",
    position = "bottom"
  }
}

local opts = {
  mode = "n",
  prefix = "<Leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false
}

local mappings = {
  ["w"] = {"<cmd>update!<CR>", "Save"},
  ["q"] = {"<cmd>q!<CR>", "Quit"},

  b = {
    name = "Buffer",
    c = {"<Cmd>bd!<CR>", "Close current buffer"},
    D = {"<Cmd>%bd|e#|bd#<CR>", "Delete all buffers"}
  },

  z = {
    name = "Packer",
    c = {"<Cmd>PackerCompile<CR>", "Compile"},
    i = {"<Cmd>PackerInstall<CR>", "Install"},
    s = {"<Cmd>PackerSync<CR>", "Sync"},
    S = {"<Cmd>PackerStatus<CR>", "Status"},
    u = {"<Cmd>PackerUpdate<CR>", "Update"}
  },

  g = {
    name = "Git",
    s = {"<Cmd>Neogit<CR>", "Status"}
  }
}

whichkey.setup(conf)
whichkey.register(mappings, opts)

-- Transparent --
require("transparent").setup({
  enable = false
})

require("lsp_signature").setup()
