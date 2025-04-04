call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }

" Bars and window stuff
Plug 'folke/todo-comments.nvim' " Find todo comments in repo
Plug 'folke/which-key.nvim' "Show command window 
Plug 'vuciv/vim-bujo' "Task manager and Todo lists
Plug 'scrooloose/nerdtree' "Press F2 and get the directory tree
Plug 'mbbill/undotree' "Press F5 and get undohistory
Plug 'majutsushi/tagbar' "Press F3 and get a Tagbar on rhs
Plug 'ludovicchabant/vim-gutentags' "generate tags for tagbar

" Vim Gutter 
Plug 'chentoast/marks.nvim'  "Shows marks on sideline
Plug 'airblade/vim-gitgutter' "Show git status on lines on lhs.

" Git
Plug 'tpope/vim-fugitive'  "git plugin
Plug 'sindrets/diffview.nvim' "Easily cycle through different git diffs of a file
Plug 'APZelos/blamer.nvim'  "Highlights the author and commit when hoovering on a line

" Visual
Plug 'RRethy/vim-illuminate' "highlights other uses of a variable
Plug 'vim-airline/vim-airline' "Nice looking status bar
Plug 'junegunn/limelight.vim' "highlight active text section
Plug 'junegunn/goyo.vim' "focus mode

" Completion                   
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'       
Plug 'hrsh7th/cmp-cmdline'         
Plug 'hrsh7th/nvim-cmp'              

                       
" Trouble
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim' " :Trouble, shows a pretty list of error and others

"" To be able to install pyright
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Colorschemes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'thesimonho/kanagawa-paper.nvim'

" Snippets
Plug 'SirVer/ultisnips' " snippets manager
Plug 'fhill2/telescope-ultisnips.nvim'

" Other
Plug 'scrooloose/nerdcommenter' "Comment code with <leader>cc
Plug 'tpope/vim-eunuch' " File management on current buffer, rename file and move it

" --- Evaluate these plugins ---
Plug 'vimwiki/vimwiki' "wiki
Plug 'cohama/lexima.vim' "automatically add matching parathesis
Plug 'shellRaining/hlchunk.nvim' "shows indent depth

" Debug, 
Plug 'mfussenegger/nvim-dap'
Plug 'Davidyz/coredumpy.nvim' 

"----------------------------------

call plug#end()


nnoremap <SPACE> <Nop>
let mapleader=" "

" Show a red column and linewidth 120
if exists('+colorcolumn') | set colorcolumn=120 | endif

" Terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" F-key mappings
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :TroubleToggle<CR>
noremap <F5> :UndotreeToggle<CR>
nmap <F6> :Todo<CR>
nmap <F7> :Limelight!!<CR>
nmap <F8> :DiffviewOpen -uno<CR>
nmap <F12> :vsplit ~/dotfiles/nvim/hints<CR>

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

"Go to definition and declaration
lua << EOF
    vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
EOF

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

colorscheme catppuccin-mocha
"let g:sonokai_style = 'andromeda'
"colorscheme sonokai

if has('gui_running')
  set guifont=Monospace
endif

"" Enable autoread and set up checking triggers
lua << EOF
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})
EOF


""""""""""""""""""
" Plugin configs "
""""""""""""""""""

" Nerdtree config
let g:NERDTreeWinSize=31 "This doesn't work on some systems
let g:NERDTreeWinPos = "right"

"Airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''




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




"Goyo

autocmd VimEnter * noremap <Leader>z :Goyo<cr>
let g:goyo_width = "90%"

"Limelight
let g:limelight_paragraph_span = 1


" nvim cmp, Completion
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
      { name = 'ultisnips' }, -- For ultisnips users.
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


"""" Tree sitter
lua <<EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "python","markdown", "yaml"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript", "c" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF


""" Trouble
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF


""" blamer
let g:blamer_enabled = 1
let g:blamer_delay = 2000
let g:blamer_show_in_insert_modes = 0


""" Todo todo-comments

lua << EOF
    require("todo-comments").setup {}

EOF



""" marks
lua << EOF
require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- disables mark tracking for specific buftypes. default {}
  excluded_buftypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {}
}

EOF

" Ultisnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
set runtimepath+=~/dotfiles/nvim/
let g:UltiSnipsSnippetDirectories=["UltiSnips","ulti_snippets", $HOME.'/dotfiles/nvim/ulti_snippets']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" add to telescope
lua << EOF
require('telescope').load_extension('ultisnips')
EOF

"
" catppuccin
"
lua << EOF
local catppuccin = require("catppuccin")

catppuccin.setup({
  integrations = {
    ts_rainbow = true,
  },
  color_overrides = {
    mocha = {
      text = "#F4CDE9",
      subtext1 = "#DEBAD4",
      subtext0 = "#C8A6BE",
      overlay2 = "#B293A8",
      overlay1 = "#9C7F92",
      overlay0 = "#866C7D",
      surface2 = "#705867",
      surface1 = "#5A4551",
      surface0 = "#44313B",

      base = "#352939",
      mantle = "#211924",
      crust = "#1a1016",
    },
  },
})
EOF

"
" hlchunk
"
lua << EOF
local default_conf = {
    priority = 15,
    style = {
        { fg = "#806d9c" },
        { fg = "#c21f30" },
    },
    use_treesitter = true,
    chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "╭",
        left_bottom = "╰",
        right_arrow = ">",
    },
    textobject = "",
    max_file_size = 1024 * 1024,
    error_sign = true,
    -- animation related
    duration = 200,
    delay = 300,
}
require('hlchunk').setup({
    chunk = {
        enable = true
    },
    indent = {
        enable = true
    }
})
EOF
"
" telescope config
" 

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>t <cmd>Telescope tags<cr>
nnoremap <leader>r <cmd>Telescope registers<cr>
nnoremap <leader>s <cmd>Telescope ultisnips<cr>

set wildignore+=*.png,*.jpg,*.jpeg,*/build/*,*.pyc,*.log,*/log/*,*/logs/*,*.log.*,*.class,*.json,*.txt,*.cr2,*.raw
lua<<EOF 
require('telescope').setup{ defaults = { file_ignore_patterns = {'build', 'mlruns', 'cr2', 'cache'} } } 
EOF
