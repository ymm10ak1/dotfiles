return {
    {
        "mfussenegger/nvim-dap",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.keymap.set("n", "<F5>", function()
                require("dap").continue()
            end)
            vim.keymap.set("n", "<F10>", function()
                require("dap").step_over()
            end)
            vim.keymap.set("n", "<F11>", function()
                require("dap").step_into()
            end)
            vim.keymap.set("n", "<F12>", function()
                require("dap").step_out()
            end)
            vim.keymap.set("n", "<leader>b", function()
                require("dap").toggle_breakpoint()
            end)
            vim.keymap.set("n", "<leader>B", function()
                require("dap").set_breakpoint()
            end)
            vim.keymap.set("n", "<leader>lp", function()
                require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
            end)
            vim.keymap.set("n", "<leader>dr", function()
                require("dap").repl.open()
            end)
            vim.keymap.set("n", "<leader>dl", function()
                require("dap").run_last()
            end)
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
}
