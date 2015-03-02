execute pathogen#infect()
set background=dark
set guifont=PowerlineSymbols-Powerline.otf
let g:Powerline_symbols = 'fancy'
if exists('+colorcolumn') | set colorcolumn=80,120 | endif
nnoremap <F3> :buffers<CR>:buffer<Space>
set t_Co=256

" autocmd VimEnter * NERDTree
" If you want the cursor to start in main window
autocmd VimEnter * wincmd p

nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F5> :CtrlPBuffer<CR>

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

nmap <silent> <F5> :MiniBufExplorer<CR>
set ttyfast
set textwidth=120
set nowrap
set number

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"

if has('gui_running')
  set guifont=Monospace
endif
set textwidth=0 
set wrapmargin=0

