return {
  "nvim-lualine/lualine.nvim", 
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()

    local function get_short_cwd()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
    end

    local lualine_nightfly = require("lualine.themes.nightfly")
    local lazy_stats = require("lazy.stats")

    -- my customize neo-tree status line
    local neo_tree_extension = { 
      sections = { 
        lualine_a = {
          function()
            return "neo-tree 󰙅"
          end,
        },
        lualine_b = { get_short_cwd },
        lualine_c = {},
        lualine_x = {
          function()
            return "utf-8"
          end,
          { "fileformat", symbols = { unix = "" } },
          function()
            return "neo-tree 󰙅"
          end,
        },
        lualine_y = {"progress"},
        lualine_z = {"location"}
      },
      filetypes = {"neo-tree"},
    }

    -- my customize lazy status line
    local lazy_extension = { 
      sections = { 
        lualine_a = {
          function()
            return "lazy 💤"
          end,
        },
        lualine_b = {
          function()
            return "loaded: " .. lazy_stats.stats().loaded .. "/" .. lazy_stats.stats().count
          end,
        },
        lualine_x = {
          function()
            return "utf-8"
          end,
          { "fileformat", symbols = { unix = "" } },
          function()
            return "lazy 💤"
          end,
        },
        lualine_y = {"progress"},
        lualine_z = {"location"}
      },
      filetypes = {"lazy"},
    }

    local new_colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      black = "#000000",
    }

    lualine_nightfly.normal.a.bg = new_colors.blue
    lualine_nightfly.insert.a.bg = new_colors.green
    lualine_nightfly.visual.a.bg = new_colors.violet
    lualine_nightfly.command = {
      a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black, -- black
      },
    }

    require("lualine").setup({
      options = {
        theme = lualine_nightfly,
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        globalstatus = true,
      },
      sections = {
        lualine_b = {
          "branch",
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", hint = "󰌵 ", info = " " },
          },
        },
        lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
      },
      inactive_sections = {
        lualine_a = {""},
        lualine_b = {""},
        lualine_c = {""},
        lualine_x = {""},
        lualine_y = {""},
        lualine_z = {""},
      },
      extensions = {lazy_extension, neo_tree_extension},
    })
  end,
}
