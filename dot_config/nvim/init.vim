call plug#begin('~/.config/nvim/vimplug')

" -------------------------------------------------------------
" Completion
" -------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" -------------------------------------------------------------
" All-in-one Plug
" -------------------------------------------------------------
Plug 'echasnovski/mini.nvim'

" -------------------------------------------------------------
" Colorscheme
" -------------------------------------------------------------
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" -------------------------------------------------------------
" Statusline & Bufferline
" -------------------------------------------------------------
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

" -------------------------------------------------------------
" FileTree
" -------------------------------------------------------------
Plug 'kyazdani42/nvim-tree.lua'

" -------------------------------------------------------------
" Icons
" -------------------------------------------------------------
Plug 'kyazdani42/nvim-web-devicons'

" -------------------------------------------------------------
" Git Integration
" -------------------------------------------------------------
Plug 'lambdalisue/gina.vim'

call plug#end()
" -------------------------------------------------------------

" -------------------------------------------------------------
" set
" -------------------------------------------------------------
set number
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4
set autochdir
set encoding=utf-8
set fileencoding=utf-8
set clipboard+=unnamed,unnamedplus
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set showmatch matchtime=1
set noshowmode
set pumblend=10
set termguicolors

" -------------------------------------------------------------
" Keymap
" -------------------------------------------------------------
let mapleader = "\<Space>"
nnoremap <Leader> <Nop>
xnoremap <Leader> <Nop>
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     z        [ff]
xmap     z        [ff]

nnoremap <silent> j gj
nnoremap <silent> k gk

imap <silent> jj <Esc>
imap <silent> っｊ <Esc>
inoremap <silent> <Esc> <Esc>:call system('fcitx5-remote -c')<CR>

nnoremap <silent> <C-n> :NvimTreeToggle<CR>
nnoremap <silent> <Leader>r :NvimTreeRefresh<CR>
nnoremap <silent> <Leader>n :NvimTreeFindFile<CR>

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap ss :split<CR>
nnoremap vs :vsplit<CR>

" -------------------------------------------------------------
" bufferline keybind
" -------------------------------------------------------------
nnoremap <silent> gb :BufferLinePick<CR>

" -------------------------------------------------------------
"  Command
" -------------------------------------------------------------
command! Config e ~/.local/share/chezmoi/dot_config/nvim/init.vim
augroup initvimwrite
    autocmd BufWritePost ~/.local/share/chezmoi/dot_config/nvim/init.vim call system('chezmoi apply ~/.config/nvim/init.vim') | source ~/.config/nvim/init.vim
augroup END

" -------------------------------------------------------------
" cocnvim
" -------------------------------------------------------------
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint8', 'coc-prettier', 'coc-git', 'coc-fzf-preview', 'coc-lists']

nnoremap <silent> K       :<C-u>call <SID>show_documentation()<CR>
nmap     <silent> [dev]rn <Plug>(coc-rename)
nmap     <silent> [dev]a  <Plug>(coc-codeaction-selected)iw

" -------------------------------------------------------------
" coc Tab Completion
" -------------------------------------------------------------
set hidden
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ CheckBackSpace() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pubvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <C-k> coc#refresh()

inoremap <silent><expr> <CR> pubvisible() ? coc#_select_confirm()
                                \: "<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [dev]d <Plug>(coc-definition)
nmap <silent> [dev]y <Plug>(coc-type-definition)
nmap <silent> [dev]i <Plug>(coc-implementation)
nmap <silent> [dev]r <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')

" -------------------------------------------------------------
" coc typescript setting
" -------------------------------------------------------------
function! s:coc_typescript_settings() abort
    nnoremap <silent> <buffer> [dev]f :<C-u>CocCommand eslint.executeAutoFix<CR>:CocCommand prettier.formatFile<CR>
endfunction

augroup coc_ts
    autocmd!
    autocmd FileType typescript,typescriptreact call <SID>coc_typescript_settings()
augroup END

function! s:show_documentation() abort
    if index(['vim', 'help'], &filetype) >= 0
        execute 'h ' . expand('<cword>')
    elseif coc#rpc#ready()
        call CocActionAsync('doHover')
    endif
endfunction

" -------------------------------------------------------------
" fzf-preview
" -------------------------------------------------------------
nnoremap <silent> <C-p>  :<C-u>CocCommand fzf-preview.FromResources buffer project_mru project<CR>
nnoremap <silent> [ff]gs  :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [ff]gg :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [ff]b  :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [ff]f  :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>

nnoremap <silent> [ff]q  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> [ff]rf :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> [ff]d  :<C-u>CocCommand fzf-preview.CocDefinition<CR>
nnoremap <silent> [ff]t  :<C-u>CocCommand fzf-preview.CocTypeDefinition<CR>
nnoremap <silent> [ff]o  :<C-u>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>

" -------------------------------------------------------------
" colorscheme
" -------------------------------------------------------------
colorscheme nordfox

" -------------------------------------------------------------
" lua setup
" -------------------------------------------------------------

lua << EOF
    require('nvim-treesitter.configs').setup({
        highlight = {
	    enable = true,
	}
    })
    require('mini.comment').setup({})
    require('mini.cursorword').setup({})
    require('mini.indentscope').setup({})
    require('mini.jump2d').setup({
        labels = 'asdfghjkl;'
    })
    require('mini.pairs').setup({})
    -- require('mini.statusline').setup({
        -- content = {
            -- active = status_config
            -- },
    -- })
    require('bufferline').setup({
        options = {
            numbers = 'buffer_id',
            max_name_length = 18,
            offsets = {{fileType = "NvimTree", text="FileExplorer", text_align="center"}},
            separator = "slant",
            diagnostics = "coc",
        }
    })
    require('nvim-tree').setup({})

    local function make_fFtT_keymap(key, extra_opts)
        local opts = vim.tbl_deep_extend('force', { allowed_lines = { blank = false, fold = false }}, extra_opts)
        opts.hooks = opts.hooks or {}

        opts.hooks.before_start = function()
            local input = vim.fn.getcharstr()
            if input == nil then
                opts.spotter = function() return {} end
            else
                local pattern = vim.pesc(input)
                opts.spotter = MiniJump2d.gen_pattern_spotter(pattern)
            end
        end

        _G.jump2dfFtT_opts = _G.jump2dfFtT_opts or {}
        _G.jump2dfFtT_opts[key] = opts
        local command = string.format('<Cmd>lua MiniJump2d.start(_G.jump2dfFtT_opts.%s)<CR>', key)

        vim.api.nvim_set_keymap('n', key, command, {})
        vim.api.nvim_set_keymap('v', key, command, {})
        vim.api.nvim_set_keymap('o', key, command, {})
    end

    make_fFtT_keymap('f', { allowed_lines = { cursor_before = false}})
    make_fFtT_keymap('F', { allowed_lines = { cursor_after = false}})
    make_fFtT_keymap('t', {
        allowed_lines = { cursor_before = false },
        hooks = { after_jump = function() vim.api.nvim_input('<Left>') end }
    })
    make_fFtT_keymap('T', {
        allowed_lines = { cursor_after = false },
        hooks = { after_jump = function() vim.api.nvim_input('<Right>') end }
    })

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
          '%{coc#status()}',
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
EOF
