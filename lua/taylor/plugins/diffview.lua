return {
  "sindrets/diffview.nvim",
  config = function ()
    local actions = require("diffview.actions")

    require("diffview").setup({
      enhanced_diff_hl = true,
      use_icons = true,     -- Requires nvim-web-devicons
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      hooks = {
        view_opened = function(view)
          local bufnr = vim.fn.bufnr()
          vim.keymap.set("n", "q", "<cmd>DiffviewClose<CR>", { buffer = bufnr })
        end,
      },
      keymaps = {
        file_panel = {
          { "n", "J", actions.select_next_entry, { desc = "Open the diff for the next file" } },
          { "n", "K", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
        },
        file_history_panel = {
          { "n", "J", actions.select_next_entry, { desc = "Open the diff for the next file" } },
          { "n", "K", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
        }
      },
    })
  end,
  keys = {
    { "<leader>df", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>dh", "<cmd>DiffviewFileHistory<CR>", desc = "Open Diffview History" },
  },
}
