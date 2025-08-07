return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local colors = {
      -- bg = "#16181a", -- for non-transparent
      bg = "NONE",       -- for transparent
      bgAlt = "#1e2124",
      bgHighlight = "#3c4048",
      fg = "#e6e6e6",
      white = "#fcfcfc",
      grey = "#7b8496",
      blue = "#4aacfc",
      green = "#5eff6c",
      cyan = "#4DF0FF",
      red = "#f65866",
      yellow = "#fad773",
      magenta = "#ff5ef1",
      pink = "#ff5ea0",
      orange = "#f79811",
      purple = "#cd6beb",
    }

    local copilot_colors = {
      [""] = { fg = colors.grey, bg = colors.none },
      ["Normal"] = { fg = colors.grey, bg = colors.none },
      ["Warning"] = { fg = colors.red, bg = colors.none },
      ["InProgress"] = { fg = colors.yellow, bg = colors.none },
    }

    local cyberdream_theme = {
      normal = {
        a = { fg = colors.blue, bg = colors.bg, gui = "bold" },
        b = { fg = colors.cyan, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
        x = { fg = colors.fg, bg = colors.bg },
        y = { fg = colors.magenta, bg = colors.bg },
        z = { fg = colors.grey, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.green, bg = colors.bg, gui = "bold" },
        z = { fg = colors.grey, bg = colors.bg },
      },
      visual = {
        a = { fg = colors.magenta, bg = colors.bg, gui = "bold" },
        z = { fg = colors.grey, bg = colors.bg },
      },
      command = {
        a = { fg = colors.yellow, bg = colors.bg, gui = "bold" },
        z = { fg = colors.grey, bg = colors.bg },
      },
      replace = {
        a = { fg = colors.red, bg = colors.bg, gui = "bold" },
        z = { fg = colors.grey, bg = colors.bg },
      },
      terminal = {
        a = { fg = colors.green, bg = colors.bg, gui = "bold" },
        z = { fg = colors.grey, bg = colors.bg },
      },
    }


    -- get current working directory
    local function get_short_cwd()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
    end


    -- customize extensions
    local neo_tree = {
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { get_short_cwd },
        lualine_c = {
          function()
            return "Neo-Tree 󰙅"
          end,
        },
        lualine_y = {
          { "progress" },
          { "location", color = { fg = colors.cyan, bg = colors.none }, },
        },
        lualine_z = {
          function()
            return "  " .. os.date("%X") .. " 🚀 "
          end,
        },
      },
      filetypes = { "neo-tree" },
    }


    local telescope = {
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = " " } },
        lualine_c = {
          function()
            return "Telescope 🔭 "
          end,
        },
        lualine_y = {
          { "progress" },
          { "location", color = { fg = colors.cyan, bg = colors.none } },
        },
        lualine_z = {
          function()
            return "  " .. os.date("%X") .. " 🚀 "
          end,
        },
      },
      filetypes = { "TelescopePrompt" },
    }


    local toggleterm = {
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_c = {
          function()
            return "ToggleTerm  "
          end,
        },
        lualine_y = {
          { "progress" },
          { "location", color = { fg = colors.cyan, bg = colors.none } },
        },
        lualine_z = {
          function()
            return "  " .. os.date("%X") .. " 🚀 "
          end,
        },
      },
      filetypes = { "toggleterm" },
    }


    -- mini.icons
    require("mini.icons").setup()

    -- mock nvim-web-devicons to use mini.icons instead
    require("mini.icons").mock_nvim_web_devicons()

    -- use for retrieving "auto" from colorscheme to setup lualine theme
    local lualine_require = require("lualine_require")
    local modules = lualine_require.lazy_require {
      highlight = "lualine.highlight",
      loader = "lualine.utils.loader",
      utils_section = "lualine.utils.section",
      utils = "lualine.utils.utils",
      utils_notices = "lualine.utils.notices",
      config_module = "lualine.config",
      nvim_opts = "lualine.utils.nvim_opts",
    }

    require("lualine").setup({
      options = {
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        theme = function()
          if vim.g.colors_name == "cyberdream" then
            return cyberdream_theme
          end

          -- get it from lualine.lua, has to return a table
          local ok, theme = pcall(modules.loader.load_theme, "auto")
          if ok and theme then
            return theme
          end
        end,
        disabled_filetypes = {
          statusline = { "alpha" },
          winbar = {},
        },
        ignore_focus = {},
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = " " } },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              hint = "󰌵 ",
              info = " ",
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", symbols = { modified = " 󰈅 ", readonly = " 🔒", unnamed = "  " } },
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = colors.green },
          },
          {
            function()
              local icon = " "
              local status = require("copilot.api").status.data
              return icon .. (status.message or "")
            end,
            cond = function()
              local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
              return ok and #clients > 0
            end,
            color = function()
              if not package.loaded["copilot"] then
                return
              end
              local status = require("copilot.api").status.data
              return copilot_colors[status.status] or copilot_colors[""]
            end,
          },
          { "diff" },
        },
        lualine_y = {
          { "progress" },
          { "location", color = { fg = colors.cyan, bg = colors.none } },
        },
        lualine_z = {
          function()
            return "  " .. os.date("%X") .. " 🚀 "
          end,
        },
      },
      extensions = {
        -- neo_tree,
        -- telescope,
        toggleterm,
      },
    })
  end,
}
