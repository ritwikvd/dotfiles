return function ()
    local vscode = require("vscode")
    local colors = require("vscode.colors").get_colors()

    vscode.setup({
        group_overrides = {
            Cursor = { bg = colors.vscLightBlue, bold = false },
            CursorLine = {bg = "#eeeeee"},
            MatchParen = {bg = "#aeafad"}
        }
    })

    vscode.load()
end
