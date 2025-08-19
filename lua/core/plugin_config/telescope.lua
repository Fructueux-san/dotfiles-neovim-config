local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})


vim.keymap.set('n', 'fs', builtin.git_status, {})
vim.keymap.set('n', 'fb', builtin.git_branches, {})
vim.keymap.set('n', 'fc', builtin.git_commits, {})
