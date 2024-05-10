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

    dashboard.section.header.opts.hl = "AlphaHeader"

    -- get it from reddit
    local buttonhl = function(shortcut, text, command, hl)
      local button = dashboard.button(shortcut, text, command)
      button.opts.hl_shortcut = hl
      return button
    end

    dashboard.section.buttons.val = {
      buttonhl("SPC eo", " > Toggle file explorer", "<cmd>Neotree toggle<CR>", "AlphaButtons"),
      buttonhl("SPC sf", "󰱼 > Search File", "<cmd>Telescope find_files<CR>", "AlphaButtons"),
      buttonhl("SPC so", "󱋡 > Search Old File", "<cmd>Telescope oldfiles<CR>", "AlphaButtons"),
      buttonhl("SPC sg", " > Search Pattern", "<cmd>Telescope live_grep<CR>", "AlphaButtons"),
      buttonhl("SPC sh", "󰸱 > Search highlights", "<cmd>Telescope highlights<CR>", "AlphaButtons"),
      buttonhl("q", " > Quit NVIM", "<cmd>qa<CR>", "AlphaButtons"),
      -- dashboard.button("SPC sc", " > Switch Color", "<cmd>Telescope colorscheme<CR>"),
    }

    dashboard.config.opts.noautocmd = true
    alpha.setup(dashboard.config)
  end,
}
