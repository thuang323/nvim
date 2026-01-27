return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local tailwind_tools = require("tailwind-tools")

    tailwind_tools.setup({})
  end
}
