return {
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("cyberdream").setup({
  --       variant = "auto",
  --       transparent = true,
  --       saturation = 1,         -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
  --       italic_comments = true,
  --       hide_fillchars = false,
  --       borderless_pickers = true,         -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
  --       terminal_colors = true,
  --       cache = false,
  --
  --       -- Override highlight groups with your own colour values
  --       highlights = {
  --         -- Highlight groups to override, adding new groups is also possible
  --         -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
  --
  --         -- Example:
  --         -- Comment = { fg = "#696969", bg = "NONE", italic = true },
  --
  --         -- More examples can be found in `lua/cyberdream/extensions/*.lua`
  --       },
  --
  --       -- Override a highlight group entirely using the built-in colour palette
  --       -- overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
  --       --     -- Example:
  --       --     return {
  --       --         Comment = { fg = colors.green, bg = "NONE", italic = true },
  --       --         ["@property"] = { fg = colors.magenta, bold = true },
  --       --     }
  --       -- end,
  --
  --       -- Override colors
  --       colors = {
  --         -- For a list of colors see `lua/cyberdream/colours.lua`
  --
  --         -- Override colors for both light and dark variants
  --         -- bg = "#000000",
  --         -- green = "#00ff00",
  --         --
  --         -- -- If you want to override colors for light or dark variants only, use the following format:
  --         -- dark = {
  --         --     magenta = "#ff00ff",
  --         --     fg = "#eeeeee",
  --         -- },
  --         -- light = {
  --         --     red = "#ff5c57",
  --         --     cyan = "#5ef1ff",
  --         -- },
  --       },
  --
  --       -- Disable or enable colorscheme extensions
  --       extensions = {
  --         markview = false,
  --       },
  --     })
  --     vim.cmd("colorscheme cyberdream")
  --   end
  -- },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local colors = {
        bg = "#16181a",
        bgAlt = "#1e2124",
        bgHighlight = "#3c4048",
        fg = "#e6e6e6",
        white = "#fcfcfc",
        grey = "#7b8496",
        -- blue = "#4aacfc",
        blue = "#319df5",
        green = "#5eff6c",
        cyan = "#4DF0FF",
        red = "#f65866",
        -- yellow = "#fad773",
        yellow = "#f0c348",
        magenta = "#ff5ef1",
        pink = "#ff5ea0",
        orange = "#f79811",
        -- purple = "#cd6beb",
        purple = "#c472ed",
      }

      local normalbg = "#141415"
      local promptTitleBg = "#FF9185"
      local neotreeRootFg = "#dd9046"
      local delimiterFg = "#bbc0c9"
      -- local delimiterBg = "#252527"
      -- local normalbg = "#111112"
      -- local promptTitleBg = "#FF7E70"
      local comment = "#abb0b8"

      local diffAddBg = "#7da186"
      local diffAddBg2 = "#40574b"
      local diffDeleteBg = "#b56e6e"
      local diffChangeBg = "#cfb742"
      local utils = require("taylor.utils.colors")
      require("cyberdream").setup({
        variant = "auto",
        transparent = true,
        italic_comments = true,
        hide_fillchars = false,
        borderless_pickers = true,
        -- borderless_telescope = false,
        terminal_colors = true,
        cache = false,
        highlights = {
          -- Terminal
          Directory = { fg = colors.blue },
          Search = { fg = normalbg, bg = "#f2cc81" },
          IncSearch = { fg = normalbg, bg = "#dd9046" },
          CurSearch = { link = "IncSearch" },
          -- CursorLine = { bg = "#29292b" },
          CursorLine = { bg = "#252527" },
          -- TabLineFill = { link = "Search" },


          -- Syntax
          Comment = { fg = comment },
          Constant = { fg = colors.orange },
          String = { fg = colors.green },
          Character = { fg = colors.green },
          Identifier = { fg = colors.fg },
          Function = { fg = colors.blue, italic = true },
          Statement = { fg = colors.purple },
          Operator = { fg = colors.fg },
          Keyword = { fg = colors.purple },
          Execption = { link = "Keyword" },
          PreProc = { link = "Keyword" },
          Type = { fg = colors.yellow },
          Special = { fg = colors.red },
          Debug = { fg = colors.orange },
          -- Delimiter = { fg = delimiterFg, bg = delimiterBg },
          Delimiter = { fg = delimiterFg },
          Todo = { fg = colors.purple, bold = true },
          Number = { fg = colors.orange },
          Boolean = { fg = colors.orange },
          -- MatchParen = { fg = colors.fg, bg = colors.grey },
          -- MatchParen = { fg = colors.purple },


          -- Treesitter
          ["@field"] = { fg = colors.red },
          ["@constant"] = { fg = colors.orange },
          ["@operator"] = { fg = colors.fg },
          -- ["@operator"] = { fg = "#32d7e6" },
          ["@type"] = { link = "Type" },
          ["@boolean"] = { fg = colors.orange },
          ["@type.builtin"] = { fg = colors.purple },
          ["@type.definition"] = { fg = colors.purple },
          ["@type.qualifier"] = { fg = colors.purple },
          ["@constant.builtin"] = { link = "@constant" },
          ["@constant.macro"] = { link = "@constant" },
          ["@function.builtin"] = { fg = colors.cyan },
          ["@punctuation.bracket"] = { link = "Delimiter" },
          ["@variable.parameter"] = { fg = colors.red },
          ["@variable.member"] = { fg = colors.red },
          ["@variable.builtin"] = { fg = colors.yellow },
          ["@keyword.operator"] = { fg = colors.purple },
          ["@tag"] = { fg = colors.red },
          ["@tag.attribute"] = { fg = colors.orange },
          ["@tag.delimiter"] = { fg = colors.fg },
          -- ["@tag.delimiter"] = { fg = colors.purple },

          ["@number"] = { fg = colors.orange },

          ["@lsp.type.property"] = { fg = colors.cyan },
          ["@lsp.type.macro"] = { fg = colors.orange },
          ["@lsp.type.parameter"] = { fg = colors.red },
          -- ["@lsp.type.bracket"] = { fg = colors.purple },
          ["@lsp.type.enumMember"] = { fg = colors.cyan },
          -- ["@lsp.type.operator"] = { fg = colors.purple },
          -- ["@lsp.mod.userDefined"] = { fg = colors.blue },
          -- ["@lsp.typemod.operator.userDefined"] = { fg = colors.fg },
          -- ["@lsp.typemod.operator.userDefined"] = { fg = colors.blue },
          ["@lsp.mod.constructor"] = { fg = colors.blue },
          ["@lsp.typemod.variable.static"] = { fg = colors.orange },
          -- ["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.red },
          ["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.yellow },
          -- ["@lsp.typemod.property.defaultLibrary"] = { fg = colors.red },
          ["@lsp.typemod.property.defaultLibrary"] = { fg = colors.cyan },
          ["@lsp.typemod.function.defaultLibrary"] = { fg = colors.cyan },

          -- python highlights
          ["@variable.python"] = { fg = colors.red },
          ["@constructor.python"] = { fg = colors.yellow },
          ["@type.builtin.python"] = { fg = colors.yellow },
          -- ["@function.builtin.python"] = { fg = colors.blue },

          ["@odp.base_constructor.python"] = { fg = colors.cyan },
          ["@odp.import_module.python"] = { fg = colors.fg },
          ["@odp.constructor.python"] = { link = "@constructor.python" },
          ["@odp.keyword.class.python"] = { link = "@keyword.function.python" },
          ["@odp.function.builtin.python"] = { fg = colors.cyan },
          -- ["@odp.decorator.python"] = { link = "@function" },
          -- ["@odp.decorator.function.python"] = { link = "@function" },
          -- ["@odp.import_from.python"] = { fg = theme.palette.purple, style = config.styles.keywords },
          -- ["@odp.interpolation.python"] = { fg = theme.palette.red, style = config.styles.parameters },
          -- ["@odp.keyword.python"] = { style = config.styles.keywords },
          -- ["@odp.operator.splat.python"] = { fg = theme.palette.fg },
          -- ["@odp.punctuation.special.python"] = { fg = theme.palette.purple },

          -- javascript highlights
          ["@variable.javascript"] = { fg = colors.red },
          ["@operator.javascript"] = { fg = colors.fg },
          ["@variable.member.javascript"] = { fg = colors.cyan },
          ["@lsp.type.variable.javascriptreact"] = { fg = colors.red },
          ["@lsp.type.variable.javascript"] = { fg = colors.red },
          ["@punctuation.special.javascript"] = { fg = colors.orange },
          ["@tag.builtin.javascript"] = { fg = colors.blue },
          ["@tag.javascript"] = { fg = colors.red },
          ["@lsp.typemod.variable.readonly.javascriptreact"] = { fg = colors.orange },

          -- typescript highlights
          ["@variable.typescript"] = { fg = colors.red },
          ["@variable.tsx"] = { fg = colors.red },
          ["@lsp.type.variable.typescriptreact"] = { fg = colors.red },
          ["@lsp.type.variable.typescript"] = { fg = colors.red },
          ["@tag.builtin.tsx"] = { fg = colors.blue },
          ["@punctuation.special.typescript"] = { fg = colors.orange },
          ["@type.builtin.typescript"] = { fg = colors.yellow },
          ["@variable.builtin.typescript"] = { fg = colors.yellow },
          -- ["@odp.operator.fat_arrow.typescript"] = { fg = colors.purple },
          -- ["@odp.property.function.typescript"] = { link = "@function.typescript" },
          ["@lsp.type.typeParameter.typescript"] = { fg = colors.yellow },

          -- json/jsonc highlights
          ["@property.json"] = { fg = colors.red },
          ["@odp.braces.json"] = { fg = colors.purple },
          ["@property.jsonc"] = { fg = colors.red },
          ["@odp.braces.jsonc"] = { fg = colors.purple },

          -- cpp highlights
          ["@lsp.typemod.variable.defaultLibrary.cpp"] = { fg = colors.red },


          Pmenu = { bg = normalbg, fg = colors.fg },
          -- floating window
          NormalFloat = { bg = normalbg, fg = colors.fg },
          FloatBorder = { bg = normalbg, fg = colors.bg },


          -- Telescope
          TelescopeNormal = { bg = colors.bg },
          TelescopeBorder = { fg = colors.bg, bg = colors.bg },
          TelescopeMatching = { fg = colors.orange },
          TelescopePreviewBorder = { fg = colors.bg, bg = colors.bg },
          TelescopePreviewNormal = { bg = colors.bg },
          TelescopePreviewTitle = { fg = colors.bg, bg = "#aae6b2", bold = true },
          TelescopePromptBorder = { fg = colors.bgAlt, bg = colors.bgAlt },
          TelescopePromptNormal = { fg = colors.fg, bg = colors.bgAlt },
          TelescopePromptPrefix = { fg = colors.grey, bg = colors.bgAlt },
          TelescopePromptTitle = { fg = colors.bg, bg = promptTitleBg, bold = true },
          TelescopeResultsBorder = { fg = colors.bg, bg = colors.bg },
          TelescopeResultsNormal = { bg = colors.bg },
          TelescopeResultsTitle = { fg = colors.bg, bg = colors.bg },


          -- Alpha
          AlphaHeader = { fg = colors.orange },
          AlphaButtons = { fg = colors.purple },
          -- AlphaHeader = { fg = "#70FF81" },


          -- GitSigns
          GitSignsAdd = { fg = colors.green },
          GitSignsChange = { fg = colors.blue },
          GitSignsDelete = { fg = colors.red },


          -- Neotree
          NeoTreeRootName = { fg = neotreeRootFg, bold = true },
          NeoTreeFileName = { fg = colors.fg },
          NeoTreeGitModified = { fg = colors.yellow },
          NeoTreeGitConflict = { fg = colors.red, bold = true, italic = true },
          NeoTreeGitUntracked = { fg = colors.red, italic = true },
          NeoTreeSymbolicLinkTarget = { fg = colors.purple },
          NeoTreeCursorLine = { bold = true, italic = true },
          -- NeoTreeDimText = {},
          NeoTreeMessage = { fg = colors.grey, italic = true },
          -- NeoTreeFileStats = {},
          -- NeoTreeFileStatsHeader = {},
          -- NeoTreeFilterTerm = {},
          -- NeoTreeTitleBar = {},


          -- Cmp
          CmpDocumentation = { fg = colors.grey, bg = colors.bg },
          CmpDocumentationBorder = { fg = colors.grey, bg = colors.bg },
          CmpGhostText = { fg = colors.grey, bg = colors.bg },
          CmpItemAbbr = { fg = colors.fg, bg = colors.bg },
          CmpItemAbbrDeprecated = { fg = colors.grey, bg = colors.bg, strikethrough = true },
          CmpItemAbbrMatch = { fg = colors.orange, bg = colors.bg },
          CmpItemAbbrMatchFuzzy = { fg = colors.orange, bg = colors.bg, underline = true },
          CmpItemKindVariable = { fg = colors.purple, bg = colors.bg },
          CmpItemKindInterface = { fg = colors.green, bg = colors.bg },
          CmpItemKindText = { fg = colors.grey, bg = colors.bg },
          CmpItemKindFunction = { fg = colors.blue, bg = colors.bg },
          CmpItemKindMethod = { fg = colors.blue, bg = colors.bg },
          CmpItemKindKeyword = { fg = colors.cyan, bg = colors.bg },
          CmpItemKindProperty = { fg = colors.cyan, bg = colors.bg },
          CmpItemKindUnit = { fg = colors.green, bg = colors.bg },
          CmpItemKindEnum = { fg = colors.purple, bg = colors.bg },
          CmpItemMenu = { fg = colors.grey, bg = colors.bg },
          CmpItemKindDefault = { fg = colors.red, bg = colors.bg },
          markdownCode = { fg = colors.green },
          -- DiffText = { fg = colors.yellow, bg = colors.bgHighlight, bold = true, italic = true },


          -- WhichKey
          WhichKey = { fg = colors.red },
          WhichKeyGroup = { fg = colors.orange },
          WhichKeyDesc = { fg = colors.blue },
          WhichKeySeparator = { fg = colors.green },
          WhichKeyFloat = { bg = colors.bg },
          WhichKeyValue = { fg = colors.green },


          -- Diagnostic
          DiagnosticOk = { fg = colors.green },
          DiagnosticError = { fg = colors.red },
          DiagnosticWarn = { fg = colors.yellow },
          DiagnosticInfo = { fg = colors.cyan },
          DiagnosticHint = { fg = colors.purple },

          DiagnosticSignTextOk = { link = "DiagnosticOk" },
          DiagnosticSignTextError = { link = "DiagnosticError" },
          DiagnosticSignTextWarn = { link = "DiagnosticWarn" },
          DiagnosticSignTextInfo = { link = "DiagnosticInfo" },
          DiagnosticSignTextHint = { link = "DiagnosticHint" },

          DiagnosticFloatingTextOk = { link = "DiagnosticOk" },
          DiagnosticFloatingTextError = { link = "DiagnosticError" },
          DiagnosticFloatingTextWarn = { link = "DiagnosticWarn" },
          DiagnosticFloatingTextInfo = { link = "DiagnosticInfo" },
          DiagnosticFloatingTextHint = { link = "DiagnosticHint" },

          DiagnosticVirtualTextOk = { link = "DiagnosticOk" },
          DiagnosticVirtualTextError = { link = "DiagnosticError" },
          DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
          DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
          DiagnosticVirtualTextHint = { link = "DiagnosticHint" },

          DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
          DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
          DiagnosticUnderlineInfo = { sp = colors.cyan, underdashed = true },
          DiagnosticUnderlineHint = { sp = colors.purple, underdotted = true },

          -- Bufferline
          BufferLineSeparator = { fg = colors.grey },
          BufferLineTabSeparator = { fg = colors.grey },
          BufferLineBufferSelected = { fg = colors.fg, italic = true },
          BufferLineDiagnosticSelected = { fg = colors.fg, italic = true },
          BufferLineHintSelected = { fg = colors.purple, italic = true },
          BufferLineHintDiagnosticSelected = { fg = colors.purple, italic = true },
          BufferLineInfoSelected = { fg = colors.cyan, italic = true },
          BufferLineInfoDiagnosticSelected = { fg = colors.cyan, italic = true },
          BufferLineWarningSelected = { fg = colors.yellow, italic = true },
          BufferLineWarningDiagnosticSelected = { fg = colors.yellow, italic = true },
          BufferLineErrorSelected = { fg = colors.red, italic = true },
          BufferLineErrorDiagnosticSelected = { fg = colors.red, italic = true },
          BufferLineIndicatorSelected = { fg = colors.blue, italic = true },

          -- Trouble
          TroubleCount = { fg = colors.fg, bg = colors.bg },
          TroubleNormal = { link = "TelescopeNormal" },
          TroubleNormalNC = { link = "TelescopeNormal" },


          -- todo-comments
          TodoBgTODO = { bg = colors.cyan, fg = colors.bg, bold = true },
          TodoBgWARN = { bg = colors.yellow, fg = colors.bg, bold = true },
          TodoBgNOTE = { bg = colors.green, fg = colors.bg, bold = true },
          TodoBgPERF = { bg = colors.purple, fg = colors.bg, bold = true },
          TodoBgFIX = { bg = colors.red, fg = colors.white, bold = true },
          TodoBgHACK = { bg = colors.yellow, fg = colors.bg, bold = true },
          -- TodoBgTEST = {},
          TodoFgTODO = { fg = colors.cyan },
          TodoFgWARN = { fg = colors.yellow },
          TodoFgNOTE = { fg = colors.green },
          TodoFgPERF = { fg = colors.purple },
          TodoFgFIX = { fg = colors.red },
          TodoFgHACK = { fg = colors.yellow },
          -- TodoFgTEST = {},
          TodoSignNOTE = { fg = colors.green },
          TodoSignPERF = { fg = colors.purple },
          -- TodoSignTEST = {},


          -- diffview
          DiffAdd = { bg = utils.darken(diffAddBg, 0.7, diffAddBg2) },
          DiffDelete = { bg = utils.darken(diffDeleteBg, 0.6, colors.bg) },
          DiffText = { bg = utils.darken(diffAddBg, 0.7, diffAddBg2) },
          DiffChange = { bg = utils.darken(diffChangeBg, 0.5, colors.bg) },

          -- blink
          -- BlinkCmpMenu = { link = "TelescopeNormal" },
          -- BlinkCmpMenuBorder = { link = "TelescopeNormal" },
          -- BlinkCmpDoc = { link = "TelescopeNormal" },
          -- BlinkCmpSignatureHelp = { link = "TelescopeNormal" },
        },

        extensions = {
          markview = false,
        },
      })

      vim.cmd("colorscheme cyberdream")
      vim.opt.background = "dark"
    end,
  },
}
