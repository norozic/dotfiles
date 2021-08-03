vim.cmd 'command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles("--exclude-standard --cached --others")'

vim.api.nvim_set_keymap('n', '<Leader>a', ':<C-u>Ag<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g', ':<C-u>Rg<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', ':<C-u>Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>m', ':<C-u>History<CR>', { noremap = true, silent = true })
