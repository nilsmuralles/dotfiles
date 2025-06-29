return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Get preview of git changes" })
    vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Get user who changed on Git" })
  end
}
