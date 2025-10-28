return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit", "Gstatus", "Gblame" },
  keys = {
    { "<leader>gs", ":G<CR>", desc = "Git status (Fugitive)" },
    { "<leader>gb", ":Gblame<CR>", desc = "Git blame" },
    { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff split" },
    { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
    { "<leader>gp", ":Git push<CR>", desc = "Git push" },
  },
  config = function()
    -- optional: open fugitive status in a vertical split
    vim.g.fugitive_summary_vertical = 1
  end,
}
