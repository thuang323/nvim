return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- get current working directory
		local function get_short_cwd()
			return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
		end

		-- customize colors
		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#2d3041",
			inactive_bg = "#2c3043",
		}

		-- customize lualine theme
		local lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

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
					{ "fileformat", symbols = { unix = "" } },
					function()
						return "neo-tree 󰙅"
					end,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			filetypes = { "neo-tree" },
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
					{ "fileformat", symbols = { unix = "" } },
					function()
						return "lazy 💤"
					end,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			filetypes = { "lazy" },
		}

		-- my customize telescope status line
		local telescope_extension = {
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_x = {
					{ "fileformat", symbols = { unix = "" } },
					function()
						return "TelescopePrompt "
					end,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			filetypes = { "TelescopePrompt" },
		}

		local toggle_extension = {
			sections = {
				lualine_a = {
					function()
						return "ToggleTerm "
					end,
				},
				lualine_x = {
					{ "fileformat", symbols = { unix = "" } },
					function()
						return "ToggleTerm "
					end,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			filetypes = { "toggleterm" },
		} --

		local alpha_extension = {
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_x = {
					{ "fileformat", symbols = { unix = "" } },
					function()
						return "Home "
					end,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			filetypes = { "alpha" },
		}

		local harpoon_extension = {
			sections = {
				lualine_a = {
					function()
						return "Harpoon Menu"
					end,
				},
				lualine_b = {
					"branch",
				},
				lualine_x = {
					{ "fileformat", symbols = { unix = "" } },
					function()
						return "harpoon 󱓞"
					end,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			filetypes = { "harpoon" },
		}

		local mason_extension = {
			sections = {
				lualine_a = { "mode" },
				lualine_x = {
					{ "fileformat", symbols = { unix = "" } },
					function()
						return "mason "
					end,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			filetypes = { "mason" },
		}

		require("lualine").setup({
			options = {
				theme = lualine_theme,
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
				lualine_a = { "" },
				lualine_b = { "" },
				lualine_c = { "" },
				lualine_x = { "" },
				lualine_y = { "" },
				lualine_z = { "" },
			},
			extensions = {
				lazy_extension,
				neo_tree_extension,
				telescope_extension,
				toggle_extension,
				alpha_extension,
				harpoon_extension,
				mason_extension,
			},
		})
	end,
}
