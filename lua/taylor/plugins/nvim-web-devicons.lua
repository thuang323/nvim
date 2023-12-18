return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local asm = {
      icon = "",
      color = "#ff6f3f",
      name = "Assembly"
    }

    require("nvim-web-devicons").setup({
      override_by_extension = {
        ["s"] = asm,
      },
    })
  end,
}
