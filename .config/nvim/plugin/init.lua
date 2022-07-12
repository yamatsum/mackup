vim.cmd([[packadd packer.nvim]])

require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("neovim/nvim-lspconfig")
    use("nvim-lua/plenary.nvim")
    use("williamboman/nvim-lsp-installer")
    use("nvim-treesitter/nvim-treesitter")
    use("kyazdani42/nvim-web-devicons")
    use({ "yamatsum/nvim-nonicons", branch = "feat/lua" })
    use("projekt0n/github-nvim-theme")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-cmdline")
    use("nvim-telescope/telescope.nvim")
    use("kyazdani42/nvim-tree.lua")
    use("ahmedkhalf/project.nvim")
    use("nvim-lualine/lualine.nvim")
    -- use("vimpostor/vim-tpipeline")
    use("rafcamlet/tabline-framework.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("norcalli/snippets.nvim")
    use("phaazon/hop.nvim")
    use("b3nj5m1n/kommentary")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("lewis6991/gitsigns.nvim")
    use("yamatsum/nvim-cursorline")
    use("norcalli/nvim-colorizer.lua")
    use("windwp/nvim-autopairs")
    use("numToStr/Navigator.nvim")
    use("ur4ltz/surround.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("rcarriga/nvim-notify")
    use({
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
    })
    -- use("github/copilot.vim")
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
      working_sym = "",
      error_sym = "",
      done_sym = "",
      moved_sym = "",
    },
  },
})
