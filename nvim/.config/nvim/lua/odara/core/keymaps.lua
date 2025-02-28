-- General Keymaps -------------------
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })
vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Exit insert mode with jj' })
vim.keymap.set('i', 'kk', '<ESC>', { desc = 'Exit insert mode with kk' })
vim.keymap.set('i', ':w', '<ESC>:w<CR>', { desc = 'Exit insert and save' })

-- clear search highlights
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- Lazy
vim.keymap.set('n', '<leader>lz', ':Lazy<CR>', { desc = '[L]a[z]y Plugin Manager' })

-- Markers
vim.keymap.set('n', '<leader>cm', ':delmarks a-zA-Z0-9<cr>', { desc = '[C]lear [M]arkers' })

-- Increment and Decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' }) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' }) -- decrement

-- window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split [W]indow [V]ertically' }) -- split window vertically
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split [W]indow [H]orizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make [W]window Splits [E]qual Size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

-- tabs management
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

-- Disable arrow keys in normal and visual modes
vim.keymap.set({ 'n', 'v' }, '<left>', '<cmd>echo "Please only use h to move to left."<CR>')
vim.keymap.set({ 'n', 'v' }, '<right>', '<cmd>echo "Please only use l to move to right."<CR>')
vim.keymap.set({ 'n', 'v' }, '<up>', '<cmd>echo "Please only use k to move up."<CR>')
vim.keymap.set({ 'n', 'v' }, '<down>', '<cmd>echo "Please only use j to move down."<CR>')

-- Keybinds to make split navigation easier.
if vim.g.odara.global.is_servers or not vim.g.odara.plugins.vim_tmux_navigator then
  vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
end
