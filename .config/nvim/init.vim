let mapleader = " "
let maplocalleader = " "

" Load plugins
lua << EOF
local gh = function(repo) return 'https://github.com/' .. repo end
vim.pack.add({
  gh('tpope/vim-surround'),
  gh('tpope/vim-repeat'),
  gh('justinmk/vim-sneak'),
  gh('guns/vim-sexp'),
  gh('tpope/vim-sexp-mappings-for-regular-people'),
  gh('tpope/vim-vinegar'),
  gh('tpope/vim-fugitive'),
  gh('tpope/vim-rsi'),
  gh('dense-analysis/ale'),
  gh('junegunn/fzf'),
  gh('junegunn/fzf.vim'),
  gh('tpope/vim-sensible'),
  gh('tpope/vim-sleuth'),
  gh('Olical/conjure'),
  gh('Mofiqul/vscode.nvim'),
  gh('nvim-treesitter/nvim-treesitter'),
  gh('neovim/nvim-lspconfig'),
  { src = gh('folke/snacks.nvim'), version = 'stable' },
  { src = gh('folke/which-key.nvim'), version = 'stable' },
  gh('nvim-tree/nvim-web-devicons'),
  gh('nvim-mini/mini.icons'),
  { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') },
})
EOF

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '98%,98%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.98, 'height': 0.98 } }
endif

" General shortcuts
nnoremap <leader><leader>g :vertical Git<CR>

" Switch the annoying arrow keys when using the :e command
set wildmode=longest:full,full

" https://vi.stackexchange.com/questions/22627/switching-arrow-key-mappings-for-wildmenu-tab-completion
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" Turn off cursor keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Open vertical splits on the right side
set splitright

" copy/paste to "+ (clipboard)
vmap <Leader>y "+y
map <Leader>p "+p
vmap <Leader>p "+p
map <Leader>P "+P
vmap <Leader>P "+P

" copy file path/name to clipboard
nnoremap <leader>fp :let @+=expand("%")<CR>
nnoremap <leader>fn :let @+=expand("%:t")<CR>

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
set laststatus=2
set number
set cursorline
set scrolloff=5

autocmd VimEnter * normal :

lua << EOF

vim.lsp.enable('clojure_lsp')

require('mini.icons').setup()

vim.cmd.colorscheme "vscode"

local Snacks = require("snacks")

Snacks.setup({
  image = { enabled = false },  -- Disable image previews
  icons = { enabled = false },   -- Disable icons
  picker = {
    enabled = true,
    win = {
      input = {
        keys = {
          ["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
          ["<c-\\>"] = { "toggle_ignored", mode = { "i", "n" } },
        }
      },
      list = {
        keys = {
          ["<c-h>"] = { "toggle_hidden", mode = { "n" } },
          ["<c-\\>"] = { "toggle_ignored", mode = { "n" } },
        }
      }
    }
  }
})

local wk = require("which-key")

wk.setup({
  delay = 1000,  -- Set the delay in milliseconds
})

-- Lazy load on first insert mode entry (may not necessary)
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

local blink = require("blink.cmp")

blink.setup({
      keymap = { preset = "super-tab" },
      appearance = {
	  nerd_font_variant = "mono",
	  use_nvim_cmp_as_default = true,
      },
      completion = {
	  documentation = { auto_show = false },
      },
      sources = {
	  default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = {
	  implementation = "prefer_rust_with_warning",
      },
})

local function get_visual_selection()
    -- this is only for selection on a single line
    local _, srow, scol = unpack(vim.fn.getpos("v"))
    local _, erow, ecol = unpack(vim.fn.getpos("."))
    local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
    if srow == erow then
        return string.sub(lines[1], scol, ecol)
    end
    return ''
end

vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = 'Go to definition' })
vim.keymap.set('n', 'gq', function() vim.lsp.buf.format({async = true}) end, { desc = 'Format buffer' })
vim.keymap.set('x', 'gq', function() vim.lsp.buf.format({async = true}) end, { desc = 'Format selection' })
vim.keymap.set('n', '<leader><leader>p', function() Snacks.picker.pickers() end, { desc = 'Find picker' })
vim.keymap.set('n', '<leader><leader>f', function() Snacks.picker.files() end, { desc = 'Find file' })
vim.keymap.set('n', '<leader><leader>b', function() Snacks.picker.buffers() end, { desc = 'Find buffer' })
vim.keymap.set('n', '<leader><leader>s', function() Snacks.picker.smart() end, { desc = 'Smart' })
vim.keymap.set('n', '<leader><leader>e', function() Snacks.picker.explorer() end, { desc = 'File explorer' })
vim.keymap.set('n', '<leader>/', function() Snacks.picker.grep() end, { desc = 'Search in files' })
vim.keymap.set('x', '<leader>*', function() Snacks.picker.grep({ search = get_visual_selection() }) end, { desc = 'Search selection' })

EOF

