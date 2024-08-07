vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.cursorline = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.o.number = true
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.cursorlineopt = "both"

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>t', ':Neotree<CR>')

-- These keymaps are inspired from Craftdogz example
local keymap = vim.keymap
-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit ')

keymap.set('n', 'tc', ':tabclose<CR>')
keymap.set('n', 'tn', ':tabnext<CR>');
keymap.set('n', 'tp', ':tabprevious<CR>');
keymap.set('n', 'tt', ':tabs<CR>');
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Neotree
keymap.set('n', '<C-t>', ':Neotree toggle<CR>')

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[ 
  set clipboard=unnamed,unnamedplus
]]

vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]

