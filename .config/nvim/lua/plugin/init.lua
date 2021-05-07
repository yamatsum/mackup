vim.cmd [[packadd packer.nvim]]

require("packer").startup {
  function()
    use {
      "wbthomason/packer.nvim",
      opt = true
    }
    use {
      "neovim/nvim-lspconfig",
      config = [[require('plugin.nvim-lspconfig')]]
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      config = [[require('plugin.nvim-treesitter')]]
    }
    use {
      "yamatsum/nvim-nonicons",
      requires = {
        {"kyazdani42/nvim-web-devicons"}
      }
    }
    use {
      "hrsh7th/nvim-compe",
      config = [[require('plugin.nvim-compe')]]
    }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      },
      config = [[require('plugin.telescope')]]
    }
    use "Th3Whit3Wolf/one-nvim"
    use {
      "kyazdani42/nvim-tree.lua",
      config = [[require('plugin.nvim-tree')]]
    }
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      config = [[require('plugin.galaxyline')]]
    }
    use "norcalli/snippets.nvim"
    use {
      "phaazon/hop.nvim",
      config = [[require('plugin.hop')]]
    }
    use {
      "b3nj5m1n/kommentary",
      config = [[require('plugin.kommentary')]]
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      branch = "lua",
      config = [[require('plugin.indent-blankline')]]
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = [[require('plugin.gitsigns')]]
    }
    use {
      "yamatsum/nvim-cursorline"
      -- disable = true
    }
    use {
      "norcalli/nvim-colorizer.lua",
      config = require "colorizer".setup()
    }
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app & yarn install"
    }
    use {
      "windwp/nvim-autopairs",
      config = [[require('plugin.nvim-autopairs')]]
    }
    --
    use "tpope/vim-surround" -- sandwich, surround.nvim
    use {
      "christoomey/vim-tmux-navigator",
      config = [[require('plugin.vim-tmux-navigator')]]
    }
    use {
      "dense-analysis/ale",
      config = [[require('plugin.ale')]]
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}})
      end,
      working_sym = "",
      error_sym = "",
      done_sym = "",
      moved_sym = ""
    }
  }
}
