return function ()
    local vscode = require("vscode")
    local colors = require("vscode.colors").get_colors()
    print("inside setting up vscode colours")

    vscode.setup({
        group_overrides = {
            Cursor = { fg = colors.vscDarkBlue, bg = "#aeafad" , bold = false },
            CursorLine = {bg = "#eeeeee"},
            MatchParen = {bg = "NONE"}
        }
    })
    vscode.load()
end
