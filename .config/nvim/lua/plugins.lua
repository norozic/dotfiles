require 'paq-nvim' {
  'antoinemadec/coc-fzf';
  'cohama/lexima.vim';
  'editorconfig/editorconfig-vim';
  'elzr/vim-json';
  'folke/tokyonight.nvim';
  'hoob3rt/lualine.nvim';
  'junegunn/fzf.vim';
  'previm/previm';
  'savq/paq-nvim';
  'tpope/vim-surround';
  'tyru/open-browser.vim';
  'vim-scripts/vim-auto-save';
  'wbthomason/packer.nvim';
  { 'neoclide/coc.nvim', branch = 'release' };
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
  { 'phaazon/hop.nvim', branch = 'pre-extmarks' };
}

require 'lualine'
