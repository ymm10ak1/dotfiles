local vscode = require("utils").vscode_check

return {
    "dstein64/vim-startuptime",
    conf = vscode,
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
        vim.g.startuptime_tries = 30
    end,
}
