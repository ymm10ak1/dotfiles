local vscode = require("utils").vscode_check

return {
    "iamcco/markdown-preview.nvim",
    cond = vscode,
    keys = {
        { "<M-p>", "<cmd>MarkdownPreviewToggle<CR>" },
    },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
}
