return function ()
    local active, inactive = {}, {}
    local activeleft, activeright, inactiveleft, inactiveright = {}, {}, {}, {}

    table.insert(active, activeleft)
    table.insert(active, activeright)
    table.insert(inactive, inactiveleft)
    table.insert(inactive, inactiveright)

    local mode = {
        provider = "vi_mode"
    }

    table.insert(activeleft, mode)

    require("feline").setup({
        -- components = {
        --     active = active,
        --     ianctive = inactive
        -- }
    })
end
