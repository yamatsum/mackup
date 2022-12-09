vim.cmd [[packadd packer.nvim]]

return require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "nvim-lua/plenary.nvim"
    use { "williamboman/mason.nvim", requires = { "williamboman/mason-lspconfig.nvim" } }
    use "nvim-treesitter/nvim-treesitter"
    use { "yamatsum/nvim-nonicons", requires = { "nvim-tree/nvim-web-devicons" } }
    use "projekt0n/github-nvim-theme"
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
      },
    }
    use "nvim-telescope/telescope.nvim"
    use "nvim-tree/nvim-tree.lua"
    use "ahmedkhalf/project.nvim"
    use "nvim-lualine/lualine.nvim"
    use "vimpostor/vim-tpipeline"
    use "akinsho/bufferline.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "phaazon/hop.nvim"
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "lewis6991/gitsigns.nvim"
    use "yamatsum/nvim-cursorline"
    use "Akianonymus/nvim-colorizer.lua"
    use "windwp/nvim-autopairs"
    use "numToStr/Navigator.nvim"
    use "kylechui/nvim-surround"
    use "jose-elias-alvarez/null-ls.nvim"
    use "rcarriga/nvim-notify"
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
    }
    -- use("github/copilot.vim")
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
      working_sym = "",
      error_sym = "",
      done_sym = "",
      moved_sym = "",
    },
  },
}
