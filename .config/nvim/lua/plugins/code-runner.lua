return {
  "CRAG666/code_runner.nvim",
  keys = {
    { "<C-A-n>", "<Cmd>RunCode<CR>", desc = "CodeRunner RunCode" },
  },
  opts = {
    filetype = {
      cpp = {
        "cd $dir &&",
        "g++ -std=c++23 -O2 -Wall -Wextra $fileName",
        "-o $fileNameWithoutExt &&",
        "$dir/$fileNameWithoutExt",
      },
    },
  },
}
