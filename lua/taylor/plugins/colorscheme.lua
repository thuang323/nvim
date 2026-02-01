return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night",
  --   },
  --   config = function ()
  --     vim.cmd[[colorscheme tokyonight-night]]
  --   end
  -- },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local cyberdream_colors = {
        bg = "#0a0a0a",
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
        search_bg = "#f2cc81",
        incsearch_bg = "#dd9046",
      }
      require("cyberdream").setup({
        transparent = true,
        saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
        italic_comments = true,
        hide_fillchars = false,
        borderless_pickers = true,
        terminal_colors = false,
        cache = false,

        -- override colors
        colors = {
          dark = {
            bg_alt = "#252525",
            orange = "#f79811",
            cyan = "#4df0ff",
            blue = "#0f8ef5",
            purple = "#c472ed",
            yellow = "#f0c348",
            bg_highlight = "#30343b",
          },
        },
        -- highlights = {
        --   DiffViewDiffAddAsDelete = { fg = cyberdream_colors.blue, bg = cyberdream_colors.bg },
        -- },

        -- override a highlight group entirely
        overrides = function(colors)
          return {
            Pmenu = { fg = cyberdream_colors.fg, bg = cyberdream_colors.bg_alt },
            NormalFloat = { fg = cyberdream_colors.fg, bg = cyberdream_colors.bg_alt },
            NonText = { fg = cyberdream_colors.grey },
            Search = { fg = cyberdream_colors.bg_alt, bg = cyberdream_colors.search_bg },
            IncSearch = { fg = cyberdream_colors.bg_alt, bg = cyberdream_colors.incsearch_bg },
            CurSearch = { link = "IncSearch" },
            FloatTitle = { fg = cyberdream_colors.bg, bg = cyberdream_colors.cyan },
            FloatFooter = { bg = "NONE" },

            Keyword = { fg = cyberdream_colors.purple },
            ["@keyword.type"] = { fg = cyberdream_colors.purple, italic = true },
            Type = { fg = cyberdream_colors.yellow },
            ["@module"] = { fg = cyberdream_colors.yellow },
            Boolean = { fg = cyberdream_colors.orange },
            Constant = { fg = cyberdream_colors.yellow },
            ["@constant.builtin"] = { fg = cyberdream_colors.yellow },
            ["@constructor"] = { fg = cyberdream_colors.blue },

            -- ["@property"] = { fg = colors.magenta, bold = true },

            -- Snacks
            SnacksDashboardNormal = { link = "Normal" },
            SnacksNotifierHistory = { link = "NormalFloat" },

            -- BufferLine
            BufferLineIndicatorSelected = { fg = cyberdream_colors.blue },

            -- Trouble
            TroubleCount = { fg = cyberdream_colors.fg },

            -- GitSigns
            GitSignsChange = { fg = cyberdream_colors.blue },

            -- Diffview
            -- DiffDelete = { fg = cyberdream_colors.grey, bg = "#442927" },
            -- DiffViewDiffAddAsDelete = { fg = cyberdream_colors.blue, bg = cyberdream_colors.bg },
          }
        end,

        -- Disable or enable colorscheme extensions
        extensions = {
          markview = false,
        },
      })
      vim.cmd("colorscheme cyberdream")
    end
  },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --       highlights = {
  --         -- Syntax
  --         Comment = { fg = comment },
  --         Constant = { fg = colors.orange },
  --         String = { fg = colors.green },
  --         Character = { fg = colors.green },
  --         Identifier = { fg = colors.fg },
  --         Function = { fg = colors.blue, italic = true },
  --         Statement = { fg = colors.purple },
  --         Operator = { fg = colors.fg },
  --         Keyword = { fg = colors.purple },
  --         Execption = { link = "Keyword" },
  --         PreProc = { link = "Keyword" },
  --         Type = { fg = colors.yellow },
  --         Special = { fg = colors.red },
  --         Debug = { fg = colors.orange },
  --         -- Delimiter = { fg = delimiterFg, bg = delimiterBg },
  --         Delimiter = { fg = delimiterFg },
  --         Todo = { fg = colors.purple, bold = true },
  --         Number = { fg = colors.orange },
  --         Boolean = { fg = colors.orange },
  --
  --
  --         -- Treesitter
  --         ["@field"] = { fg = colors.red },
  --         ["@constant"] = { fg = colors.orange },
  --         ["@operator"] = { fg = colors.fg },
  --         -- ["@operator"] = { fg = "#32d7e6" },
  --         ["@type"] = { link = "Type" },
  --         ["@boolean"] = { fg = colors.orange },
  --         ["@type.builtin"] = { fg = colors.purple },
  --         ["@type.definition"] = { fg = colors.purple },
  --         ["@type.qualifier"] = { fg = colors.purple },
  --         ["@constant.builtin"] = { link = "@constant" },
  --         ["@constant.macro"] = { link = "@constant" },
  --         ["@function.builtin"] = { fg = colors.cyan },
  --         ["@punctuation.bracket"] = { link = "Delimiter" },
  --         ["@variable.parameter"] = { fg = colors.red },
  --         ["@variable.member"] = { fg = colors.red },
  --         ["@variable.builtin"] = { fg = colors.yellow },
  --         ["@keyword.operator"] = { fg = colors.purple },
  --         ["@tag"] = { fg = colors.red },
  --         ["@tag.attribute"] = { fg = colors.orange },
  --         ["@tag.delimiter"] = { fg = colors.fg },
  --         -- ["@tag.delimiter"] = { fg = colors.purple },
  --
  --         ["@number"] = { fg = colors.orange },
  --
  --         ["@lsp.type.property"] = { fg = colors.cyan },
  --         ["@lsp.type.macro"] = { fg = colors.orange },
  --         ["@lsp.type.parameter"] = { fg = colors.red },
  --         -- ["@lsp.type.bracket"] = { fg = colors.purple },
  --         ["@lsp.type.enumMember"] = { fg = colors.cyan },
  --         -- ["@lsp.type.operator"] = { fg = colors.purple },
  --         -- ["@lsp.mod.userDefined"] = { fg = colors.blue },
  --         -- ["@lsp.typemod.operator.userDefined"] = { fg = colors.fg },
  --         -- ["@lsp.typemod.operator.userDefined"] = { fg = colors.blue },
  --         ["@lsp.mod.constructor"] = { fg = colors.blue },
  --         ["@lsp.typemod.variable.static"] = { fg = colors.orange },
  --         -- ["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.red },
  --         ["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.yellow },
  --         -- ["@lsp.typemod.property.defaultLibrary"] = { fg = colors.red },
  --         ["@lsp.typemod.property.defaultLibrary"] = { fg = colors.cyan },
  --         ["@lsp.typemod.function.defaultLibrary"] = { fg = colors.cyan },
  --
  --         -- python highlights
  --         ["@variable.python"] = { fg = colors.red },
  --         ["@constructor.python"] = { fg = colors.yellow },
  --         ["@type.builtin.python"] = { fg = colors.yellow },
  --         -- ["@function.builtin.python"] = { fg = colors.blue },
  --
  --         ["@odp.base_constructor.python"] = { fg = colors.cyan },
  --         ["@odp.import_module.python"] = { fg = colors.fg },
  --         ["@odp.constructor.python"] = { link = "@constructor.python" },
  --         ["@odp.keyword.class.python"] = { link = "@keyword.function.python" },
  --         ["@odp.function.builtin.python"] = { fg = colors.cyan },
  --         -- ["@odp.decorator.python"] = { link = "@function" },
  --         -- ["@odp.decorator.function.python"] = { link = "@function" },
  --         -- ["@odp.import_from.python"] = { fg = theme.palette.purple, style = config.styles.keywords },
  --         -- ["@odp.interpolation.python"] = { fg = theme.palette.red, style = config.styles.parameters },
  --         -- ["@odp.keyword.python"] = { style = config.styles.keywords },
  --         -- ["@odp.operator.splat.python"] = { fg = theme.palette.fg },
  --         -- ["@odp.punctuation.special.python"] = { fg = theme.palette.purple },
  --
  --         -- javascript highlights
  --         ["@variable.javascript"] = { fg = colors.red },
  --         ["@operator.javascript"] = { fg = colors.fg },
  --         ["@variable.member.javascript"] = { fg = colors.cyan },
  --         ["@lsp.type.variable.javascriptreact"] = { fg = colors.red },
  --         ["@lsp.type.variable.javascript"] = { fg = colors.red },
  --         ["@punctuation.special.javascript"] = { fg = colors.orange },
  --         ["@tag.builtin.javascript"] = { fg = colors.blue },
  --         ["@tag.javascript"] = { fg = colors.red },
  --         ["@lsp.typemod.variable.readonly.javascriptreact"] = { fg = colors.orange },
  --
  --         -- typescript highlights
  --         ["@variable.typescript"] = { fg = colors.red },
  --         ["@variable.tsx"] = { fg = colors.red },
  --         ["@lsp.type.variable.typescriptreact"] = { fg = colors.red },
  --         ["@lsp.type.variable.typescript"] = { fg = colors.red },
  --         ["@tag.builtin.tsx"] = { fg = colors.blue },
  --         ["@punctuation.special.typescript"] = { fg = colors.orange },
  --         ["@type.builtin.typescript"] = { fg = colors.yellow },
  --         ["@variable.builtin.typescript"] = { fg = colors.yellow },
  --         -- ["@odp.operator.fat_arrow.typescript"] = { fg = colors.purple },
  --         -- ["@odp.property.function.typescript"] = { link = "@function.typescript" },
  --         ["@lsp.type.typeParameter.typescript"] = { fg = colors.yellow },
  --
  --         -- json/jsonc highlights
  --         ["@property.json"] = { fg = colors.red },
  --         ["@odp.braces.json"] = { fg = colors.purple },
  --         ["@property.jsonc"] = { fg = colors.red },
  --         ["@odp.braces.jsonc"] = { fg = colors.purple },
  --
  --         -- cpp highlights
  --         ["@lsp.typemod.variable.defaultLibrary.cpp"] = { fg = colors.red },
  --
  --
  --         -- Diagnostic
  --         DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
  --         DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
  --         DiagnosticUnderlineInfo = { sp = colors.cyan, underdashed = true },
  --         DiagnosticUnderlineHint = { sp = colors.purple, underdotted = true },
  --     })
  --   end,
  -- },
}
