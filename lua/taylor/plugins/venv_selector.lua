return {
  "linux-cultist/venv-selector.nvim",
  lazy = true,
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  config = function()
    require("venv-selector").setup {
      -- anaconda_base_path = "/opt/anaconda",
      -- anaconda_envs_path = "/home/cado/.conda/envs",
      anaconda_base_path = "/usr/local/anaconda",
      anaconda_envs_path = "/usr/local/anaconda3/envs/",
    }
  end,
  -- event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
  },
}
