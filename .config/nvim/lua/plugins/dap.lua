local vscode = require("utils").vscode_check

return {
    {
        "mfussenegger/nvim-dap",
        cond = vscode,
        event = "LspAttach",
        keys = {
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "Continue",
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end,
                desc = "Step Over",
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end,
                desc = "Step Into",
            },
            {
                "<F12>",
                function()
                    require("dap").step_out()
                end,
                desc = "Step Out",
            },
            {
                "<leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Toggle Breakpoint",
            },
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        cond = vscode,
        event = "LspAttach",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
    },
}
