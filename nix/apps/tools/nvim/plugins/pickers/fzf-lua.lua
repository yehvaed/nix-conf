local map = vim.keymap.set
require("fzf-lua").setup({
  'telescope',
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

map ("n", "<leader>ff", "<cmd> FzfLua files <cr>", { desc = "Find files" }) 
map ("n", "<leader>fw", "<cmd> FzfLua live_grep <cr>", { desc = "Live grep" }) 
map ("n", "<leader>fb", "<cmd> FzfLua buffers <cr>", { desc = "Find buffer" }) 
map ('n', "<leader>fc", "<cmd> FzfLua commands <cr>", { desc = "Pick command" })
