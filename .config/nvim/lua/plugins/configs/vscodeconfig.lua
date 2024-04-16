return function ()
    local vscode = require("vscode")
    local colors = require("vscode.colors").get_colors()

    vscode.setup({
        group_overrides = {
            Cursor = { fg = colors.vscDarkBlue, bg = "#aeafad" , bold = false },
            CursorLine = {bg = "#eeeeee"},
            MatchParen = {bg = "NONE"}
        }
    })
    vscode.load()
end
