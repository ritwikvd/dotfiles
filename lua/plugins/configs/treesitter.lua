return function ()
    require("nvim-treesitter.configs")
    .setup({
        context_commentstring = {enable = true},
        autotag = {enable = true}
    })
end
