vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
		-- lua
		use {
				'wbthomason/packer.nvim',
				opt = true
			}
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
		use {
				'lewis6991/gitsigns.nvim',
				requires = {
					'nvim-lua/plenary.nvim'
				}
			}
		use 'yamatsum/nvim-cursorline'

		-- vim script
		use 'tomtom/tcomment_vim'
		use 'jiangmiao/auto-pairs'
		use 'easymotion/vim-easymotion'
		use 'christoomey/vim-tmux-navigator'
		use 'Yggdroot/indentLine'
		use 'lukas-reineke/indent-blankline.nvim'
		use 'tpope/vim-surround'
		use {
				'iamcco/markdown-preview.nvim',
				run = 'cd app & yarn install'
			}
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
		'gitsigns',

		'indentLine',
		'vim-easymotion',
		'vim-tmux-navigator',
	}
)
