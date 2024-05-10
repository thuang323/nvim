return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      -- bg = "#16181a", -- for non-transparent
      bg = "NONE", -- for transparent
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


    local lazy_stats = require("lazy.stats")

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


    local lazy = {
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = {
          function()
            return "loaded: " .. lazy_stats.stats().loaded .. "/" .. lazy_stats.stats().count
          end,
        },
        lualine_c = {
          function()
            return "Lazy 💤"
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
      filetypes = { "lazy" },
    }


    local telescope = {
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
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
            -- return "ToggleTerm "
            return "ToggleTerm "
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


    local harpoon = {
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = {
          function()
            return "Harpoon Menu"
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
      filetypes = { "harpoon" },
    }


    local mason = {
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_c = {
          function()
            return "Mason "
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
      filetypes = { "mason" },
    }


    require("lualine").setup({
      options = {
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        theme = cyberdream_theme,
        disabled_filetypes = {
          statusline = { "alpha" },
          winbar = {},
        },
        ignore_focus = {},
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
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
          { "filename", symbols = { modified = "  ", readonly = "", unnamed = "" } },
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
              local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
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
        lazy,
        neo_tree,
        telescope,
        toggleterm,
        harpoon,
        mason,
      },
    })
  end,
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		-- get current working directory
-- 		local function get_short_cwd()
-- 			return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
-- 		end
--
-- 		-- customize colors
-- 		local colors = {
-- 			blue = "#65D1FF",
-- 			green = "#3EFFDC",
-- 			violet = "#FF61EF",
-- 			yellow = "#FFDA7B",
-- 			red = "#FF4A4A",
-- 			fg = "#c3ccdc",
-- 			bg = "#2d3041",
-- 			inactive_bg = "#2c3043",
-- 		}
--
-- 		-- customize lualine theme
-- 		local lualine_theme = {
-- 			normal = {
-- 				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			insert = {
-- 				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			visual = {
-- 				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			command = {
-- 				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			replace = {
-- 				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
-- 				b = { bg = colors.bg, fg = colors.fg },
-- 				c = { bg = colors.bg, fg = colors.fg },
-- 			},
-- 			inactive = {
-- 				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
-- 				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
-- 				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
-- 			},
-- 		}
--
-- 		local lazy_stats = require("lazy.stats")
--
-- 		-- my customize neo-tree status line
-- 		local neo_tree_extension = {
-- 			sections = {
-- 				lualine_a = {
-- 					function()
-- 						return "neo-tree 󰙅"
-- 					end,
-- 				},
-- 				lualine_b = { get_short_cwd },
-- 				lualine_c = {},
-- 				lualine_x = {
-- 					{ "fileformat", symbols = { unix = "" } },
-- 					function()
-- 						return "neo-tree 󰙅"
-- 					end,
-- 				},
-- 				lualine_y = { "progress" },
-- 				lualine_z = { "location" },
-- 			},
-- 			filetypes = { "neo-tree" },
-- 		}
--
-- 		-- my customize lazy status line
-- 		local lazy_extension = {
-- 			sections = {
-- 				lualine_a = {
-- 					function()
-- 						return "lazy 💤"
-- 					end,
-- 				},
-- 				lualine_b = {
-- 					function()
-- 						return "loaded: " .. lazy_stats.stats().loaded .. "/" .. lazy_stats.stats().count
-- 					end,
-- 				},
-- 				lualine_x = {
-- 					{ "fileformat", symbols = { unix = "" } },
-- 					function()
-- 						return "lazy 💤"
-- 					end,
-- 				},
-- 				lualine_y = { "progress" },
-- 				lualine_z = { "location" },
-- 			},
-- 			filetypes = { "lazy" },
-- 		}
--
-- 		-- my customize telescope status line
-- 		local telescope_extension = {
-- 			sections = {
-- 				lualine_a = { "mode" },
-- 				lualine_b = { "branch" },
-- 				lualine_x = {
-- 					{ "fileformat", symbols = { unix = "" } },
-- 					function()
-- 						return "TelescopePrompt "
-- 					end,
-- 				},
-- 				lualine_y = { "progress" },
-- 				lualine_z = { "location" },
-- 			},
-- 			filetypes = { "TelescopePrompt" },
-- 		}
--
-- 		local toggle_extension = {
-- 			sections = {
-- 				lualine_a = {
-- 					function()
-- 						return "ToggleTerm "
-- 					end,
-- 				},
-- 				lualine_x = {
-- 					{ "fileformat", symbols = { unix = "" } },
-- 					function()
-- 						return "ToggleTerm "
-- 					end,
-- 				},
-- 				lualine_y = { "progress" },
-- 				lualine_z = { "location" },
-- 			},
-- 			filetypes = { "toggleterm" },
-- 		} --
--
-- 		local alpha_extension = {
-- 			sections = {
-- 				lualine_a = { "mode" },
-- 				lualine_b = { "branch" },
-- 				lualine_x = {
-- 					{ "fileformat", symbols = { unix = "" } },
-- 					function()
-- 						return "Home "
-- 					end,
-- 				},
-- 				lualine_y = { "progress" },
-- 				lualine_z = { "location" },
-- 			},
-- 			filetypes = { "alpha" },
-- 		}
--
-- 		local harpoon_extension = {
-- 			sections = {
-- 				lualine_a = {
-- 					function()
-- 						return "Harpoon Menu"
-- 					end,
-- 				},
-- 				lualine_b = {
-- 					"branch",
-- 				},
-- 				lualine_x = {
-- 					{ "fileformat", symbols = { unix = "" } },
-- 					function()
-- 						return "harpoon 󱓞"
-- 					end,
-- 				},
-- 				lualine_y = { "progress" },
-- 				lualine_z = { "location" },
-- 			},
-- 			filetypes = { "harpoon" },
-- 		}
--
-- 		local mason_extension = {
-- 			sections = {
-- 				lualine_a = { "mode" },
-- 				lualine_x = {
-- 					{ "fileformat", symbols = { unix = "" } },
-- 					function()
-- 						return "mason "
-- 					end,
-- 				},
-- 				lualine_y = { "progress" },
-- 				lualine_z = { "location" },
-- 			},
-- 			filetypes = { "mason" },
-- 		}
--
-- 		require("lualine").setup({
-- 			options = {
-- 				theme = lualine_theme,
-- 				disabled_filetypes = {
-- 					statusline = {},
-- 					winbar = {},
-- 				},
-- 				ignore_focus = {},
-- 				globalstatus = true,
-- 			},
-- 			sections = {
-- 				lualine_b = {
-- 					"branch",
-- 					{
-- 						"diagnostics",
-- 						symbols = { error = " ", warn = " ", hint = "󰌵 ", info = " " },
-- 					},
-- 				},
-- 				lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
-- 			},
-- 			inactive_sections = {
-- 				lualine_a = { "" },
-- 				lualine_b = { "" },
-- 				lualine_c = { "" },
-- 				lualine_x = { "" },
-- 				lualine_y = { "" },
-- 				lualine_z = { "" },
-- 			},
-- 			extensions = {
-- 				lazy_extension,
-- 				neo_tree_extension,
-- 				telescope_extension,
-- 				toggle_extension,
-- 				alpha_extension,
-- 				harpoon_extension,
-- 				mason_extension,
-- 			},
-- 		})
-- 	end,
}
