return {
  "sindrets/diffview.nvim",
  config = function()
    -- Lua
    local actions = require("diffview.actions")

    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        default = {
          -- Config for changed files, and staged files in diff views.
          layout = "diff2_horizontal",
          disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = false,         -- See |diffview-config-view.x.winbar_info|
        },
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      hooks = {
        view_opened = function(view)
          local bufnr = vim.fn.bufnr()
          vim.keymap.set("n", "<C-c>", "<cmd>DiffviewClose<CR>", { buffer = bufnr })
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
      }
    })
  end
}
