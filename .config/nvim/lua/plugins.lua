require 'paq-nvim' {
  'Yggdroot/indentLine';
  'cohama/lexima.vim';
  'editorconfig/editorconfig-vim';
  'elzr/vim-json';
  'folke/tokyonight.nvim';
  'junegunn/fzf.vim';
  'previm/previm';
  'tpope/vim-surround';
  'tyru/open-browser.vim';
  'wbthomason/packer.nvim';
  'hoob3rt/lualine.nvim';
  { 'neoclide/coc.nvim', branch = 'release' };
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
  { 'phaazon/hop.nvim', branch = 'pre-extmarks' };
}

require 'lualine'
