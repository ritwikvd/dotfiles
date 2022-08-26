return function ()
    local c = require("vscode.colors")
    require("vscode")
    .setup({
        group_overrides = {
            Cursor = { fg = c.vscDarkBlue, bg = "#aeafad" , bold = false },
            CursorLine = {bg = "#eeeeee"},
            MatchParen = {bg = "none"}
        }
    })
end
