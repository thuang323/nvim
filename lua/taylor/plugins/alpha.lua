return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[⠀⠀⠀⠀⠀⠀⠀⣀⣀⡰⣋⠉⠲⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⡼⠶⢬⡏⠉⠙⢦⡘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⣇⠀⣤⡇⠀⠀⣶⣷⠈⢲⠒⠲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⢀⡠⠴⠒⠚⠒⠚⠻⢄⡀⢙⠿⠂⠀⠑⠂⢇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⡴⠋⠀⡠⠄⠀⠀⠀⠀⠀⠈⠃⠀⠀⠀⠀⠀⠀⢯⠑⡆⠀⠀⢠⠒⡦⠀⡀⠀]],
			[[⡼⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡜⢿⠙⢦⡼⠠⡷⠋⡹⠀]],
			[[⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢸⢆⠀⢷⠈⠑⠀⠈⠿⠒⢲]],
			[[⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢢⣀⠀⠀⠀⠀⣏⡨⢂⡸⠀⠀⠀⢀⡴⠛⠉]],
			[[⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠁⠀⡏⠀⢀⢮⢀⠔⠉⢀⡴⠛⠛⠉⠀⠀⠀]],
			[[⠀⠀⠑⢤⣀⠀⠀⠀⢀⣀⠴⢏⢻⠀⡰⠁⢀⠀⠸⠁⠀⢠⠋⠀⢀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⢨⠭⠭⢭⣁⣀⣀⣈⠦⢄⡤⠐⠁⠀⠀⠀⢰⣇⣻⡞⠉⢧⠀⠀⠀⠀]],
			[[⠀⠀⣰⠒⠚⠒⠤⣀⠀⠀⠀⠀⢀⡾⠀⠀⠀⠀⠀⠀⠈⠓⠵⠃⠀⢸⡀⠀⠀⠀]],
			[[⠀⠀⢘⡶⠒⠒⢈⠆⠀⠀⢀⠞⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠇⠀⠀⠀]],
			[[⠀⠀⠈⠳⠒⡎⠁⡠⠊⠉⠁⠀⠀⣧⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⡼⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠉⠉⣠⠖⠲⠦⡀⢀⡼⣆⠀⠀⠀⠀⠀⡆⠀⠀⠀⠐⣅⡀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⢸⡗⢲⡦⣄⠙⢞⡒⢬⡳⣤⣀⣀⣀⣰⡄⠀⠀⠀⠇⠏⠻⢢⠀]],
			[[⠀⠀⠀⠀⠀⠀⠘⣆⠀⠈⠑⢵⡄⠀⢀⡻⠁⠀⠉⠀⠀⠈⠳⠶⡦⢐⠀⠀⠱⢂]],
			[[⠀⠀⠀⠀⠀⠀⠀⠈⠓⠦⢤⡬⠻⡶⣌⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⡏]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠤⠼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢄⣀⣀⣔⡕]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("SPC eo", " > Toggle file explorer", "<cmd>Neotree toggle<CR>"),
			dashboard.button("SPC sf", "󰱼 > Search File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC so", "󱋡 > Search Old File", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("SPC sw", " > Search Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC sh", "󰸱 > Search highlights", "<cmd>Telescope highlights<CR>"),
			-- dashboard.button("SPC sc", " > Switch Color", "<cmd>Telescope colorscheme<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		dashboard.config.opts.noautocmd = true
		alpha.setup(dashboard.config)
	end,
}
