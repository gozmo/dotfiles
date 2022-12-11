call plug#begin()
Plug 'neovim/nvim-lspconfig'

Plug 'RRethy/vim-illuminate'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Colorschemes
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'

call plug#end()


nnoremap <SPACE> <Nop>
let mapleader=" "

" Show a red column and linewidth 120
if exists('+colorcolumn') | set colorcolumn=120 | endif

" F-key mappings
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F3> :ALEToggle<CR>
noremap <F5> :UndotreeToggle<CR>

"Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Search and replace the word under the cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" Moving a line up or down
nnoremap <c-k> :m-2<cr>==
nnoremap <c-j> :m+<cr>==
xnoremap <c-k> :m-2<cr>gv=gv
xnoremap <c-j> :m'>+<cr>gv=gv

filetype plugin indent on
syntax on
set autoread
set background=dark
set encoding=utf-8
set hlsearch
set ignorecase
set noequalalways
set nowrap
set number
set showmatch
set t_Co=256
set textwidth=120
set ttyfast
set wrapmargin=0
setglobal fileencoding=utf-8

set wildignore=*.json,*.jpg,*.csv

"Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

colorscheme gruvbox
"colorscheme seoul256 

if has('gui_running')
  set guifont=Monospace
endif



""""""""""""""""""
" Plugin configs "
""""""""""""""""""

" Nerdtree config
let g:NERDTreeWinSize=31 "This doesn't work on some systems
let g:NERDTreeWinPos = "right"

"Airline config
set laststatus=2
let g:airline_powerline_fonts = 1

set wildignore+=*.png,*.jpg,*.jpeg,*/build/*,*.pyc,*.log,*/log/*,*/logs/*,*.log.*,*.class,*.json,*.txt

"Fugitive config
set diffopt+=vertical

"Undotree config
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

set undofile
set undodir=$HOME/.vim/undo-dir/

if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 4
endif

" undotree window width
if !exists('g:undotree_SplitWidth')
    if exists('g:undotree_ShortIndicators')
        let g:undotree_SplitWidth = 24
    else
        let g:undotree_SplitWidth = 30
    endif
endif

" diff window height
if !exists('g:undotree_DiffpanelHeight')
    let g:undotree_DiffpanelHeight = 10
endif

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 0
endif

" relative timestamp
if !exists('g:undotree_RelativeTimestamp')
    let g:undotree_RelativeTimestamp = 1
endif

" Highlight changed text
if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 1
endif


nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>t <cmd>Telescope help_tags<cr>
"Goyo

autocmd VimEnter * noremap <Leader>z :Goyo<cr>
let g:goyo_width = 140


" nvim cmp, Completion
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require("lspconfig").pyright.setup{
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    --root_dir = function(startpath)
    --       return M.search_ancestors(startpath, matcher)
    --  end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        },
      },
    },
    single_file_support = true
}
EOF
