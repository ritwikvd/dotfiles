return function ()
    local vscode = require("vscode")

    vscode.setup({
        group_overrides = {
            Cursor = { bg = "#E0FFFF", bold = false },
            CursorLine = {bg = "#EEEEEE"},
            MatchParen = {bg = "#AEAFAD"}
        }
    })

    vscode.load()
end
