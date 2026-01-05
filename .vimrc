:let mapleader = " "
:let maplocalleader = " "

" Load plugins
packadd! surround
packadd! vim-repeat
packadd! vim-sneak
packadd! vim-sexp
packadd! vim-sexp-mappings-for-regular-people
packadd! vim-vinegar
packadd! vim-fugitive

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
    packadd! vscode.nvim
    packadd! nvim-treesitter
    packadd! nvim-lspconfig
    lua vim.lsp.enable('clojure_lsp')
  else
    packadd! fireplace
  endif

  if exists('$TMUX')
    let g:fzf_layout = { 'tmux': '98%,98%' }
  else
    let g:fzf_layout = { 'window': { 'width': 0.98, 'height': 0.98 } }
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

" only highlight search while in cmd line
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" ...but add a shortcut for highlighting search
nnoremap <Leader>/ set hls!<CR>

" Async Lint Engine config
let g:ale_linters = {'clojure': ['clj-kondo']}
let g:ale_pattern_options = {'conjure-log.*.cljc': {'ale_enabled': 0}}
" Easy navigation between errors
nmap [w <Plug>(ale_previous_wrap)
nmap ]w <Plug>(ale_next_wrap)

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

if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --vimgrep\ --hidden\ --no-heading\ 
endif

" Custom fzf commands
command! -bang -nargs=* MyRg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " .
            \ <q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* MyAg call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

syntax on
set mouse=a
set laststatus=0

":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul

"Mode Settings

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

autocmd VimEnter * normal :

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
