return {
    "iamcco/markdown-preview.nvim",
    keys = {
        { "<M-p>", "<cmd>MarkdownPreviewToggle<CR>" },
    },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
}
