require 'plugins'
require 'rc/coc'
require 'rc/statusline'
require 'rc/telescope'
require 'rc/treesitter'

vim.cmd([[
colorscheme tokyonight
syntax on

highlight CursorLineNr ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight Normal ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight clear SignColumn

autocmd BufNewFile,BufRead *.jl set filetype=julia
autocmd BufNewFile,BufRead *.sh set filetype=bash
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8
]])

vim.g.python3_host_prog = '/usr/bin/python'
vim.g.auto_save = 1
vim.o.completeopt = 'menuone,noselect'

vim.api.nvim_set_option('autoindent', true)
vim.api.nvim_set_option('smartindent', true)
vim.api.nvim_set_option('clipboard', 'unnamed')
vim.api.nvim_set_option('scrolloff', 10)
vim.api.nvim_set_option('splitright', true)
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('updatetime', 100)
vim.api.nvim_set_option('shiftwidth', 2)
vim.api.nvim_buf_set_option(0, 'expandtab', true)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 2)
vim.api.nvim_win_set_option(0, 'list', true)
vim.api.nvim_win_set_option(0, 'listchars', 'tab:»-,trail:-,extends:»,nbsp:%')
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)

vim.api.nvim_set_keymap('', '<Space>', '<Leader>', {})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'O', [[:<C-u>call append(expand("."), '')<Cr>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>hr', ':%!xxd<Cr> :set filetype=xxd<Cr>', { noremap = true, silent = true }) -- Hex read
vim.api.nvim_set_keymap('n', '<Leader>hw', ':%!xxd -r<Cr> :set binary<Cr> :set filetype=<Cr>', { noremap = true, silent = true }) -- Hex write
vim.api.nvim_set_keymap('n', '<Leader>w', 'zf', { noremap = true, silent = true }) -- Hex write
vim.api.nvim_set_keymap('n', '<Leader>q', 'zd', { noremap = true, silent = true }) -- Hex write
vim.api.nvim_set_keymap('n', '<Leader>h', ':<C-u>noh<Cr>', { noremap = true, silent = true })

-- coc.nvim
vim.api.nvim_set_keymap('n', 'gf', ':<C-u>Format<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gq', ':<C-u>CocFix<Cr>', { noremap = true, silent = true })

-- telescope.nvim
vim.api.nvim_set_keymap('n', '<Leader>g', '<Cmd>Telescope find_files<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', '<Cmd>Telescope git_files<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', '<Cmd>Telescope current_buffer_fuzzy_find<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>o', '<Cmd>Telescope coc diagnostics<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', '<Cmd>Telescope treesitter<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>Telescope buffers<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', '<Cmd>Telescope spell_suggest<Cr>', { noremap = true, silent = true })

-- hop.nvim
vim.api.nvim_set_keymap('n', 'a', ':<C-u>HopChar1<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 's', ':<C-u>HopChar2<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':<C-u>HopLineVisual<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>a', ':<C-u>HopChar2<Cr>', { noremap = true, silent = true })

-- hop.nvim
vim.api.nvim_set_keymap('n', 'a', ':<C-u>HopChar1<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 's', ':<C-u>HopChar2<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>s', ':<C-u>HopLineVisual<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>a', ':<C-u>HopChar2<Cr>', { noremap = true, silent = true })

vim.cmd[[set shiftwidth=2
set expandtab]]
