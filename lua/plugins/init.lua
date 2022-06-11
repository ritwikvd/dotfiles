local treesitterconfig = require("plugins.configs.treesitter")
local commentconfig = require("plugins.configs.comment")
local deviconsconfig = require("plugins.configs.devicons")
local telescopeconfig = require("plugins.configs.telescope")


return require("packer").startup(function (use)

    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use({ "nvim-telescope/telescope.nvim", config = telescopeconfig, requires = {"nvim-telescope/telescope-ui-select.nvim", {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}}})
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = treesitterconfig})
    use("preservim/nerdtree")
    use("gruvbox-community/gruvbox")
    use("ryanoasis/vim-devicons")
    use({ "kyazdani42/nvim-web-devicons", config = deviconsconfig })
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
    use({ "styled-components/vim-styled-components", branch = "main" })
    use({ "numToStr/Comment.nvim", config = commentconfig })
    use("JoosepAlviste/nvim-ts-context-commentstring")

end)

