return function ()
    local active, inactive = {}, {}
    local activeleft, activeright, inactiveleft, inactiveright = {}, {}, {}, {}

    table.insert(active, activeleft)
    table.insert(active, activeright)
    table.insert(inactive, inactiveleft)
    table.insert(inactive, inactiveright)

    local mode = {
        provider = "vi_mode",
        hl = function()
        return {
            name = require('feline.providers.vi_mode').get_mode_highlight_name(),
            fg = require('feline.providers.vi_mode').get_mode_color(),
            style = 'bold'
        }
    end,
    opts = {
        show_mode_name = true
    }
    }

    table.insert(activeleft, mode)

    require("feline").setup({
        components = {
            active = active,
            ianctive = inactive
        }
    })
end
