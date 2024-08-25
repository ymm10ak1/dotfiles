local vscode = require("utils").vscode_check

return {
    "simeji/winresizer",
    cond = vscode,
    keys = {
        { "<C-e>", "<cmd>WinResizerStartResize<cr>", desc = "WinResizer Start"}
    }
}
