return {
  "nvim-telescope/telescope.nvim",
  -- branch = "0.1.x", -- specify the branch will disable some features
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        layout_strategy = "flex", -- combination of horizontal and vertical
        layout_config = {
          horizontal = {
            height = 0.9,
            preview_cutoff = 120,
            prompt_position = "top",
            width = 0.8
          },
          vertical = {
            height = 0.9,
            preview_cutoff = 40,
            prompt_position = "top",
            width = 0.8
          }
        },
        dynamic_preview_title = true,
        prompt_prefix = "   ",
        sorting_strategy = "ascending",
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        border = true,
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        mappings = {
          i = {
            ["<C-p>"] = actions.move_selection_previous,                      -- move to previous result
            ["<C-n>"] = actions.move_selection_next,                          -- move to next result
            ["<C-b>"] = actions.preview_scrolling_left,                       -- preview window scrolling left
            ["<C-f>"] = actions.preview_scrolling_right,                      -- preview window scrolling right
            ["<C-q"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
          },
        },
        file_ignore_patterns = {
          -- https://regex101.com/
          ".DS_Store",
          ".undodir",
          "*.aux",              -- latex stuff
          "*.synctex.gz",       -- latex stuff
          "*.fls",              -- latex stuff
          "^%.git/",            -- git
          "^%.git$",            -- git
          "^.*node_modules.*$", -- node
        }
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        oldfiles = {
          cwd_only = true,
        },
        lsp_references = {
          jump_type = "vsplit",
        },
      },
      extensions = {
        ["ui-select"] = {
          -- layout_strategy = "flex",
          layout_config = {
            width = 100,
            height = 30,
          },
        },
      }
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
