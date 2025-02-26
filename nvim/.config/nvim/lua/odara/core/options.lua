vim.cmd('let g:netrw_liststyle = 3')

local global = vim.g
local opt = vim.opt

vim.loader.enable()

-- Set <space> as the leader key
-- See `:help mapleader`
global.mapleader = ' '
global.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
global.have_nerd_font = true

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Clipboard
opt.clipboard:append('unnamedplus')

-- Complete
opt.completeopt = { 'noinsert', 'menuone', 'noselect' }

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeout = true
opt.timeoutlen = 1000
vim.o.ttimeoutlen = 10

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- appearance
-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = 'dark' -- colorschemes that can be light or dark will be made dark
opt.signcolumn = 'yes' -- show sign column so that text doesn't shift

-- backspace
opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = false
opt.listchars = {
  tab = '▸ ', -- Representação de tabulação
  trail = '·', -- Espaços em branco no final da linha
  nbsp = '␣', -- Espaços não quebráveis
  extends = '»', -- Indicação de texto escondido à direita
  precedes = '«', -- Indicação de texto escondido à esquerda
  eol = '↲', -- Exibe o fim da linha
  lead = '·', -- Indica espaços no início da linha
  multispace = '⋅', -- Diferencia múltiplos espaços
  leadmultispace = '│⋅', -- Representação especial para múltiplos espaços no início da linha
}
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.swapfile = false

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local last_line = vim.fn.getline('$') -- Obtém a última linha do arquivo

    if last_line ~= '' then
      vim.api.nvim_buf_set_lines(0, -1, -1, true, { '' }) -- Adiciona uma linha vazia no final
    end
  end,
})

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldmethod = 'marker'

-- Python
vim.g.python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
