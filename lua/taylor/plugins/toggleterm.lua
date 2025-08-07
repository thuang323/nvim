return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 20,
    open_mapping = require("taylor.utils.keymap").convert("<D-j>"),
    -- open_mapping = [[<c-\>]],
    persist_size = true,
    direction = "float",
    close_on_exit = true,     -- close the terminal window when the process exits
    highlights = {
      NormalFloat = {
        -- link = "NormalFloat",
        link = "TelescopeNormal",
      },
      FloatBorder = {
        -- link = "NormalFloat",
        link = "TelescopeNormal",
      },
    },
    float_opts = {
      border = "solid",
    },
  }
}
