local map = vim.keymap.set
require("fzf-lua").setup({'telescope'})

map("n", "<leader>ff", function()
  require('fzf-lua').files({
    cwd_prompt = false,
    prompt = "> ",
    fzf_opts = {
      ["--exact"] = true,
    },
    winopts = {
      preview = {
        layout = "vertical",
        vertical = 'up:65%',
      },
    },
  })
end, { desc = "Find files" })



map("n", "<leader>fw", function()
  require('fzf-lua').live_grep({
    cwd_prompt = false,
    prompt = "> ",
    fzf_opts = {
      ["--exact"] = true,
    },
    winopts = {
      preview = {
        layout = "vertical",
        vertical = 'up:65%',
      },
    },
  })
end, { desc = "Live grep" })

map ("n", "<leader>fb", "<cmd> FzfLua buffers <cr>", { desc = "Find buffer" }) 
map ('n', "<leader>fc", "<cmd> FzfLua commands <cr>", { desc = "Pick command" })
