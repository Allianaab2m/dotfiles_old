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

  -- LSP --
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require'lspconfig'.tsserver.setup{}
      require'lspconfig'.sumneko_lua.setup{}
    end,
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
    'hrsh7th/nvim-cmp',
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

  -- Movement --
  use {
    'phaazon/hop.nvim'
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
    'nvim-telescope/telescope-frecency.nvim'
  }

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

end)

-- Luasnip setting --
local luasnip = require 'luasnip'

-- Add capabilities --
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities

local lspconfig = require('lspconfig')

local servers = { 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- No Virtual Text Error --
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- Completion Setup--
local cmp = require 'cmp'
cmp.setup {
  snippet = { expand = function() end},
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
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
    { name = 'luasnip' }
  }
}

-- Lualine Setup --
local lualine = require 'lualine'
lualine.setup()

-- Fidget Setup --
local fidget = require 'fidget'
fidget.setup{}

-- Telescope Setup --
require('telescope').load_extension('gh')

-- Treesitter Setup --
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = {
      'lua',
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
