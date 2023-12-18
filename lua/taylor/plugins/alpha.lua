return {
  "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
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
				dashboard.button("SPC er", " > Toggle file explorer", ":Neotree toggle<CR>"),
				dashboard.button("SPC sf", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
				dashboard.button("SPC so", "󱋡 > Find Old Files", "<cmd>Telescope oldfiles<CR>"),
				dashboard.button("SPC fs", " > Find Word", "<cmd>Telescope live_grep<CR>"),
				dashboard.button("SPC sc", " > Switch Color", "<cmd>Telescope colorscheme<CR>"),
				dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
			}

    dashboard.config.opts.noautocmd = true
    alpha.setup(dashboard.config)
  end,
}
