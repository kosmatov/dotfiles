return {
  "tpope/vim-fugitive",
  init = function()
    local map = vim.keymap.set

    map("n", "<leader>gg", "<cmd>Git<cr>", { desc = "fugitive", remap = true })
    map("n", "<leader>gG", "<cmd>Git<cr>", { desc = "fugitive", remap = true })
    map("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "blame", remap = true })
    map("n", "<leader>gv", require("git").git_vsplit, { desc = "vsplit", remap = true })
  end,
}
