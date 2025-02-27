-- set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap

-- General Keymaps -------------------

keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })
keymap.set('i', ':w', '<ESC>:w<CR>', { desc = 'Exit insert and save' })

-- clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Lazy
keymap.set('n', '<leader>lz', ':Lazy<CR>', { desc = '[L]a[z]y Plugin Manager' })

-- Markers
keymap.set('n', '<leader>cm', ':delmarks a-zA-Z0-9<cr>', { desc = '[C]lear [M]arkers' })

-- Increment and Decrement numbers
keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' }) -- increment
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- decrement

-- window management
keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split [W]indow [V]ertically' }) -- split window vertically
keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split [W]indow [H]orizontally' }) -- split window horizontally
keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make [W]window Splits [E]qual Size' }) -- make split windows equal width & height
keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

-- tabs management
keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

-- Disable arrow keys in normal and visual modes
keymap.set({ 'n', 'v' }, '<left>', '<cmd>echo "Please only use h to move to left."<CR>')
keymap.set({ 'n', 'v' }, '<right>', '<cmd>echo "Please only use l to move to right."<CR>')
keymap.set({ 'n', 'v' }, '<up>', '<cmd>echo "Please only use k to move up."<CR>')
keymap.set({ 'n', 'v' }, '<down>', '<cmd>echo "Please only use j to move down."<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Line Numbers
vim.keymap.set('n', '<leader>rn', function()
  if vim.opt.relativenumber then
    vim.opt.relativenumber = false
  else
    vim.opt.relativenumber = true
  end
end, { desc = 'Toggle [R]elative [N]umbers' })

vim.api.nvim_create_autocmd({ 'InsertEnter' }, { pattern = '*', command = 'set norelativenumber' })
vim.api.nvim_create_autocmd({ 'InsertLeave' }, { pattern = '*', command = 'set relativenumber' })

-- Notes

-- Whitespace Chars
-- vim.keymap.set('n', '<leader>tl', function()
--   if vim.opt.list then
--     vim.opt.list = false
--   else
--     vim.opt.list = true
--   end
-- end, { desc = '[T]oggle [L]ist Mode (whitespace chars)' })

vim.api.nvim_set_keymap('n', '<leader>tk', ':lua AddTask()<CR>', { noremap = true, silent = true })

function AddTask()
  vim.ui.input({ prompt = 'Nova Tarefa: ' }, function(input)
    if input and input ~= '' then
      local cmd = 'task add ' .. vim.fn.shellescape(input)
      vim.fn.system(cmd)
      print('Tarefa adicionada: ' .. input)
    else
      print('Operação cancelada')
    end
  end)
end
