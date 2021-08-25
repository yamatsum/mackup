vim.cmd [[packadd packer.nvim]]

require("packer").startup {
  function()
    use {
      "wbthomason/packer.nvim",
      opt = true
    }
    use "neovim/nvim-lspconfig"
    use "nvim-treesitter/nvim-treesitter"
    use {
      "yamatsum/nvim-nonicons",
      requires = {
        {"kyazdani42/nvim-web-devicons"}
      }
    }
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      },
    }
    use "Th3Whit3Wolf/one-nvim"
    use "projekt0n/github-nvim-theme"
    use "kyazdani42/nvim-tree.lua"
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
    }
    use "norcalli/snippets.nvim"
    use "phaazon/hop.nvim"
    use "b3nj5m1n/kommentary"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "lukas-reineke/indent-blankline.nvim"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
    }
    use {
      "yamatsum/nvim-cursorline"
      -- disable = true
    }
    -- use {
    --   "norcalli/nvim-colorizer.lua",
    --   config = require "colorizer".setup()
    -- }
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app & yarn install"
    }
    use "windwp/nvim-autopairs"
    use "aserowy/tmux.nvim"
    --
    use "tpope/vim-surround" -- sandwich, surround.nvim
    use "dense-analysis/ale"
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({border = "rounded"})
      end,
      working_sym = "",
      error_sym = "",
      done_sym = "",
      moved_sym = ""
    }
  }
}
