return function ()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            mappings = {
                n = {
                    ["<leader>v"] = "select_vertical"
                }
            },
            borderchars = { "─", "│", "─", "│", " ", " ", " ", " " }

        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({})
            }
        }
    })

    telescope.load_extension("ui-select")
    telescope.load_extension('fzf')
end
