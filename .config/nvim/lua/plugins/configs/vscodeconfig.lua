return function ()
    local c = require("vscode.colors")
    require("vscode")
    .setup({
        group_overrides = {
            -- Cursor = { fg = c.vscDarkBlue, bg = "#cdf7f3" , bold = false },
            MatchParen = {bg = "none"}
        }
    })
end
