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
    use "nvim-lua/completion-nvim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      }
    }
    use "Th3Whit3Wolf/one-nvim"
    use "kyazdani42/nvim-tree.lua"
    use {
      "glepnir/galaxyline.nvim",
      branch = "main"
    }
    use "norcalli/snippets.nvim"
    use "phaazon/hop.nvim"
    use "b3nj5m1n/kommentary"
    use {
      "lukas-reineke/indent-blankline.nvim",
      branch = "lua"
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
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
    --
    use "jiangmiao/auto-pairs" -- nvim-autopairs
    use "tpope/vim-surround" -- sandwich, surround.nvim
    use "christoomey/vim-tmux-navigator"
    use {
      "dense-analysis/ale"
    }
  end,
  config = {
    display = {
      open_fn = require "packer.util".float,
      working_sym = "",
      error_sym = "",
      done_sym = "",
      moved_sym = ""
    }
  }
}

vim.tbl_map(
  function(path)
    require("plugin." .. path)
  end,
  {
    "nvim-tree",
    "galaxyline",
    "nvim-lspconfig",
    "nvim-treesitter",
    "completion-nvim",
    "telescope",
    "kommentary",
    "gitsigns",
    "hop",
    "indent-blankline",
    "vim-tmux-navigator",
    "ale"
  }
)
