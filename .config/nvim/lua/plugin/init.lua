vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  -- lua
  use 'nvim-treesitter/nvim-treesitter'
  use 'tjdevries/colorbuddy.vim'
  use 'Th3Whit3Wolf/onebuddy'
  use 'kyazdani42/nvim-web-devicons'
  use 'romgrk/barbar.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'my_statusline' end,
  }
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use {
    'norcalli/nvim-colorizer.lua',
    config = require'colorizer'.setup(),
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- vim script
  use 'tomtom/tcomment_vim'
  use 'jiangmiao/auto-pairs'
  use 'easymotion/vim-easymotion'
  use 'yamatsum/vim-auto-cursorline'
  use 'yamatsum/vim-cursorword'
  use 'christoomey/vim-tmux-navigator'
  use 'Yggdroot/indentLine'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-surround'
end)

vim.tbl_map(
  function(path) require('plugin.' .. path) end,
  {
    'barbar',
    'nvim-tree',
    'galaxyline',
    'nvim-lspconfig',
    'nvim-treesitter',
    'completion-nvim',
    'telescope',

    'indentLine',
    'vim-easymotion',
    'vim-gitgutter',
    'vim-tmux-navigator',
  }
)
