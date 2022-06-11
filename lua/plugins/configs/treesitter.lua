local configs = require("nvim-treesitter.configs")

return function ()
    print("inside treesitter with configs", vim.inspect(configs))
    configs.setup({
        context_commentstring = {enable = true},
        autotag = {enable = true}
    })
end
