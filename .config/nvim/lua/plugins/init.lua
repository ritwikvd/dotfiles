local treesitterconfig = require("plugins.configs.treesitter")
local commentconfig = require("plugins.configs.comment")
local deviconsconfig = require("plugins.configs.devicons")
local telescopeconfig = require("plugins.configs.telescope")
local cmpsniplspconfig = require("plugins.configs.cmpsniplsp")
local vscodeconfig = require("plugins.configs.vscodeconfig")
-- local felineconfig = require("plugins.configs.feline")

return require("packer").startup(function (use)

    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = treesitterconfig})
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("preservim/nerdtree")

    -- Themes
    use({ "Mofiqul/vscode.nvim", config = vscodeconfig})

    use("neovim/nvim-lspconfig")
    -- use({ "ryanoasis/vim-devicons", disabled = true})
    use("tpope/vim-surround")
    use("mattn/emmet-vim")
    use({"JoosepAlviste/nvim-ts-context-commentstring", config = function() require("ts_context_commentstring").setup{} end})
    use({"numToStr/Comment.nvim", config = commentconfig })
    use({ "styled-components/vim-styled-components", branch = "main" })
    -- use({"feline-nvim/feline.nvim", config = felineconfig})

    use({"kyazdani42/nvim-web-devicons", config = deviconsconfig })
    use({"windwp/nvim-ts-autotag", config = function () require("nvim-ts-autotag").setup() end})
    use({"windwp/nvim-autopairs", config = function () require("nvim-autopairs").setup({}) end})

    use({ "nvim-telescope/telescope.nvim",
    config = telescopeconfig,
    requires = {
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make"
        }
    }})

    use({ "hrsh7th/nvim-cmp", config = cmpsniplspconfig, requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
    }})

    use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

end)

