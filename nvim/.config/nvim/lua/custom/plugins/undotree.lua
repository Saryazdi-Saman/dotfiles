return {
  "mbbill/undotree",
  cmd = "UndotreeToggle", -- Lazy-load only when you call the command
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
  },
  config = function()
    -- Optional tweaks
    vim.g.undotree_WindowLayout = 2 -- Split right side
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
