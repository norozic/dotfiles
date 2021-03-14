" vim-plug
call plug#begin('~/.cache/nvim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'cocopon/iceberg.vim'
Plug 'cohama/lexima.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'phaazon/hop.nvim', { 'branch': 'pre-extmarks' }
Plug 'tpope/vim-surround'

" on-demand loading
Plug 'JuliaEditorSupport/julia-vim', { 'for': 'julia' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescript.tsx' }
Plug 'previm/previm', { 'for': 'markdown' }
Plug 'qnighy/satysfi.vim', { 'for': 'satysfi' }
Plug 'tyru/open-browser.vim', { 'for': 'markdown' }

call plug#end()

" load plugin settings
source ~/.config/nvim/plugins/coc.rc.vim
source ~/.config/nvim/plugins/indentLine.rc.vim
source ~/.config/nvim/plugins/lightline.rc.vim
source ~/.config/nvim/plugins/fzf.rc.vim
source ~/.config/nvim/plugins/csv.rc.vim
source ~/.config/nvim/plugins/vim-json.rc.vim

" fzf.vim
command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles('--exclude-standard --cached --others')
nnoremap <silent> <leader>f :<C-u>GFiles<Cr>

" load theme
colorscheme iceberg
syntax on

highlight CursorLineNr ctermbg=NONE
highlight EndOfBuffer ctermbg=NONE
highlight LineNr ctermbg=NONE
highlight NonText ctermbg=NONE
highlight Normal ctermbg=NONE
highlight SpecialKey ctermbg=NONE
highlight clear SignColumn

let g:python3_host_prog = '/usr/bin/python'

nnoremap <silent> O :<C-u>call append(expand('.'), '')<Cr>j
inoremap <silent> jj <ESC>
nnoremap <silent> s :<C-u>HopChar2<Cr>
nnoremap <silent> gf :<C-u>Format<Cr>

map <Space> <Leader>

set autoindent
set clipboard=unnamed
set expandtab
set number
set relativenumber
set scrolloff=10
set shiftwidth=2
set splitright
set tabstop=2
set updatetime=100

autocmd BufNewFile,BufRead *.jl set filetype=julia
autocmd BufNewFile,BufRead *.sh set filetype=bash
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
