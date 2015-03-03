execute pathogen#infect()

if exists('+colorcolumn') | set colorcolumn=80,120 | endif

" autocmd VimEnter * NERDTree
" If you want the cursor to start in main window
autocmd VimEnter * wincmd p

nnoremap <F3> :buffers<CR>:buffer<Space>
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F5> :CtrlPBuffer<CR>
nmap <silent> <F5> :MiniBufExplorer<CR>
nmap <C-t> :CtrlP /home/pontus/projects/trunk

for n in range(1, 9)
  exe "nnoremap <silent> <M-".n."> :".n."wincmd w<CR>"
endfor

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

let g:NERDTreeWinSize=31

set t_Co=256
set ttyfast
set textwidth=120
set nowrap
set number
set textwidth=0
set wrapmargin=0
set background=dark
set hlsearch

"Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

colorscheme blackboard

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"

if has('gui_running')
  set guifont=Monospace
endif

"Syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Minibuf expl config
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"Airline
set laststatus=2
let g:airline_powerline_fonts = 1

"Semantic highlight
:nnoremap <Leader>s :SemanticHighlightToggle<cr>
let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]

