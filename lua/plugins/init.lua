-- local treesitterconfig = require("plugins.configs.treesitter")


return require("packer").startup(function (use)

    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", setup = function ()
        require'nvim-treesitter.configs'.setup {
            context_commentstring = { enable = true },
            autotag = { enable = true }
        }

    end})
    use("preservim/nerdtree")
    use("gruvbox-community/gruvbox")
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("tpope/vim-surround")
    use("mattn/emmet-vim")
    use("rafamadriz/friendly-snippets")
    use("nvim-telescope/telescope-ui-select.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim",  run = "make" })
    use({ "styled-components/vim-styled-components", branch = "main" })
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

end)

