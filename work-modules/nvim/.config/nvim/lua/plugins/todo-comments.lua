-- Highlight and search for todo comments like TODO, HACK, BUG in your code base
return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,
    highlight = {
        comments_only = true,
    },
  },
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" } },
    { "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" } },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Previous todo comment" } },
  }
}
