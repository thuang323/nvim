return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    -- create assembly icon
    local asm = {
      icon = "",
      color = "#ff6f3f",
      name = "Assembly",
    }

    require("nvim-web-devicons").setup({
      override = {
        ["ts"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "TypeScript",
        },
        ["cts"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "Cts",
        },
        ["mts"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "Mts",
        },
        ["tsx"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "Tsx",
        },
        ["test.ts"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "TestTs",
        },
        ["test.tsx"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "TypeScriptReactTest",
        },
        ["spec.ts"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "SpecTs",
        },
        ["spec.tsx"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "TypeScriptReactSpec",
        },
        ["tsconfig.json"] = {
          icon = "",
          color = "#2c74e8",
          cterm_color = "26",
          name = "TSConfig",
        },
      },
      override_by_extension = {
        ["s"] = asm,
      },
    })
  end,
}
