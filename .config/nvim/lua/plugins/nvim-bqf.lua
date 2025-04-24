return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  config = function()
    require("bqf").setup({
      func_map = {
        split = "<C-s>",
      },
      filter = {
        fzf = {
          action_for = { ["ctrl-s"] = "split" },
        },
      },
    })
  end,
}
