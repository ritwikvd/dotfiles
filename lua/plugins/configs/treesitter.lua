local configs = require("nvim-treesitter.configs")

return function ()
    configs.setup({
        context_commentstring = {enable = true},
        autotag = {enable = true}
    })
end
