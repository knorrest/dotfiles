:let mapleader = " "
:let maplocalleader = " "

" Load plugins
packadd! surround
packadd! vim-repeat
packadd! vim-sneak
packadd! vim-sexp
packadd! vim-sexp-mappings-for-regular-people
" packadd! vim-visual-star-search
if !exists('g:vscode')
  packadd! ale
  packadd! fzf
  packadd! fzf.vim
  packadd! sensible
  packadd! sleuth
  " packadd! vlime
  if has('nvim')
    packadd! conjure
  else
    packadd! fireplace
  endif
else
  if has('nvim')
    " exit insert mode when switching buffers
    au BufEnter * stopinsert
  endif
endif

" General shortcuts
" nnoremap <leader>r :source ~/.vimrc<CR>
"imap jj <Esc>

" Turn off cursor keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" copy/paste to "+ (clipboard)
vmap <Leader>y "+y
map <Leader>p "+p
vmap <Leader>p "+p
map <Leader>P "+P
vmap <Leader>P "+P

" allows incsearch highlighting for range commands
" (acts like :?foo?t. but separate search from action, /foo then $t)
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

" mappings like unimpaired
nnoremap <silent> [a :<C-U>previous<CR>
nnoremap <silent> ]a :<C-U>next<CR>
nnoremap <silent> [A :<C-U>first<CR>
nnoremap <silent> ]A :<C-U>last<CR>
nnoremap <silent> [b :<C-U>bprevious<CR>
nnoremap <silent> ]b :<C-U>bnext<CR>
nnoremap <silent> [B :<C-U>bfirst<CR>
nnoremap <silent> ]B :<C-U>blast<CR>
nnoremap <silent> [l :<C-U>lprevious<CR>
nnoremap <silent> ]l :<C-U>lnext<CR>
nnoremap <silent> [L :<C-U>lfirst<CR>
nnoremap <silent> ]L :<C-U>llast<CR>
nnoremap <silent> [q :<C-U>cprevious<CR>
nnoremap <silent> ]q :<C-U>cnext<CR>
nnoremap <silent> [Q :<C-U>cfirst<CR>
nnoremap <silent> ]Q :<C-U>clast<CR>

nmap <C-P> :FZF<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

syntax on
set mouse=a
set laststatus=0

":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul

"Mode Settings

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

if exists('g:vscode')
  nnoremap <silent> <leader>* :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
  nnoremap <silent> <leader>/ :<C-u>call VSCodeNotify('workbench.action.findInFiles')<CR>
endif
