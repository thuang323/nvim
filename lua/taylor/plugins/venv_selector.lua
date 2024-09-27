return {
  "linux-cultist/venv-selector.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python"
  },
  event = "VeryLazy",
  branch = "regexp", -- This is the regexp branch, use this for the new version
  config = function()
    require("venv-selector").setup {
      -- anaconda_base_path = "/opt/anaconda",
      -- anaconda_envs_path = "/home/cado/.conda/envs",
      -- anaconda_base_path = "/usr/local/anaconda",
      -- anaconda_envs_path = "/usr/local/anaconda3/envs/",
      settings = {
        search = {
          anaconda_base = {
            command = "fd /python$ /usr/local/anaconda3/envs --full-path --max-depth 3 --color never -E /proc",
            type = "anaconda"
          },
        },
        options = {
          on_venv_activate_callback = nil,         -- callback function for after a venv activates
          enable_default_searches = true,          -- switches all default searches on/off
          enable_cached_venvs = true,              -- use cached venvs that are activated automatically when a python file is registered with the LSP.
          cached_venv_automatic_activation = false, -- if set to false, the VenvSelectCached command becomes available to manually activate them.
          activate_venv_in_terminal = true,        -- activate the selected python interpreter in terminal windows opened from neovim
          set_environment_variables = true,        -- sets VIRTUAL_ENV or CONDA_PREFIX environment variables
          notify_user_on_venv_activation = false,  -- notifies user on activation of the virtual env
          search_timeout = 5,                      -- if a search takes longer than this many seconds, stop it and alert the user
          debug = false,                           -- enables you to run the VenvSelectLog command to view debug logs
          require_lsp_activation = true,           -- require activation of an lsp before setting env variables

          -- telescope viewer options
          on_telescope_result_callback = nil,   -- callback function for modifying telescope results
          show_telescope_search_type = true,    -- shows which of the searches found which venv in telescope
          telescope_filter_type = "substring",   -- when you type something in telescope, filter by "substring" or "character"
        },
      },
    }
  end,
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
  },
}
