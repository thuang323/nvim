return {
  "nvim-lualine/lualine.nvim",
  priority = 1000,
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local colors = {
        bg = "#0a0a0a",
        none = "NONE",
        bg_alt = "#252525",
        bg_highlight = "#30343b",
        fg = "#ffffff",
        grey = "#7b8496",
        blue = "#0f8ef5",
        green = "#5eff6c",
        cyan = "#4df0ff",
        red = "#ff6e5e",
        yellow = "#f0c348",
        magenta = "#ff5ef1",
        pink = "#ff5ea0",
        orange = "#f79811",
        purple = "#c472ed",
    }

    local copilot_colors = {
      [""] = { fg = colors.grey, bg = colors.none },
      ["Normal"] = { fg = colors.grey, bg = colors.none },
      ["Warning"] = { fg = colors.red, bg = colors.none },
      ["InProgress"] = { fg = colors.yellow, bg = colors.none },
    }

    local cyberdream_theme = {
      normal = {
        a = { fg = colors.blue, bg = colors.none, gui = "bold" },
        b = { fg = colors.cyan, bg = colors.none },
        c = { fg = colors.fg, bg = colors.none },
        x = { fg = colors.fg, bg = colors.none },
        y = { fg = colors.magenta, bg = colors.none },
        z = { fg = colors.grey, bg = colors.none },
      },
      insert = {
        a = { fg = colors.green, bg = colors.none, gui = "bold" },
        z = { fg = colors.grey, bg = colors.none },
      },
      visual = {
        a = { fg = colors.magenta, bg = colors.none, gui = "bold" },
        z = { fg = colors.grey, bg = colors.none },
      },
      command = {
        a = { fg = colors.yellow, bg = colors.none, gui = "bold" },
        z = { fg = colors.grey, bg = colors.none },
      },
      replace = {
        a = { fg = colors.red, bg = colors.none, gui = "bold" },
        z = { fg = colors.grey, bg = colors.none },
      },
      terminal = {
        a = { fg = colors.green, bg = colors.none, gui = "bold" },
        z = { fg = colors.grey, bg = colors.none },
      },
    }


    -- get current working directory
    local function get_short_cwd()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
    end

    -- customize extensions
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
          winbar = {
            "alpha",
            "neo-tree",
            "tagbar",
            "undotree",
            "diff",
            "qf",
            "DiffviewFiles",
            "DiffviewFileHistory",
            "NeogitStatus",
            "dap-repl",
            "dapui_breakpoints",
            "dapui_console",
            "dapui_scopes",
            "dapui_stacks",
            "dapui_watches",
            "dap-view",
            "dap-view-term",
            "snacks_dashboard",
            "snacks_picker_list",
            "snacks_picker_input",
            "trouble",
            "checkhealth"
          },
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
        toggleterm,
      },
    })
  end,
}
