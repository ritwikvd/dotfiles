return function ()
    local c = require("vscode.colors")
    require("vscode")
    .setup({
        group_overrides = {
            Cursor = { fg = c.vscDarkBlue, bg = c.vscDarkBlue, bold = false },
            MatchParen = {bg = "none"}
        }
    })
end
