set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua << EOF

vim.lsp.enable('clojure_lsp')

require('mini.icons').setup()

vim.cmd.colorscheme "vscode"

local Snacks = require("snacks")

Snacks.setup({
  image = { enabled = false },  -- Disable image previews
  icons = { enabled = false },   -- Disable icons
  picker = { enabled = true }
})

local wk = require("which-key")

wk.setup({
  delay = 1000,  -- Set the delay in milliseconds
})

-- Lazy load on first insert mode entry (may not necessary)
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

local blink = require("blink.cmp")

blink.setup({
      keymap = { preset = "default" },
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
      fuzzy = { implementation = "prefer_rust_with_warning" },
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

vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', 'gq', function() vim.lsp.buf.format({async = true}) end)
vim.keymap.set('x', 'gq', function() vim.lsp.buf.format({async = true}) end)
vim.keymap.set('n', '<leader><space>', function() Snacks.picker() end)
vim.keymap.set('n', '<leader>/', function() Snacks.picker.grep() end)
vim.keymap.set('x', '<leader>*', function() Snacks.picker.grep({ search = get_visual_selection() }) end)

EOF

