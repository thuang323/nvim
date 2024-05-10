return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    -- priority = 1000, -- load this plugin first
    config = function()
      require("onedark").setup({
        style = "deep",
        transparent = false,
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "italic",
          strings = "none",
          variables = "none",
        },
        highlights = {
          -- lsp pop up window
          FloatBorder = { bg = "#101012" },
          -- FloatFooter = { bg = "#101012" },
          NormalFloat = { bg = "#101012" },
          Pmenu = { bg = "#101012" },

          -- Telescope
          TelescopeNormal = { bg = "#0d0b0b" },
          TelescopePromptBorder = { fg = "#0d0b0b", bg = "#101012" },
          TelescopeResultsBorder = { fg = "#0d0b0b", bg = "#101012" },
          TelescopePreviewBorder = { fg = "#0d0b0b", bg = "#101012" },
          TelescopePromptTitle = { fg = "#000000", bg = "#efbd5d" },
          TelescopeResultsTitle = { fg = "#000000", bg = "#db8ad6" },
          TelescopePreviewTitle = { fg = "#000000", bg = "#aae6b2" },

          -- WhichKey
          WhichKeyFloat = { bg = "#101012" },
        },
      })
      -- require("onedark").load()
    end,
  },
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
        blue = "#4aacfc",
        green = "#5eff6c",
        cyan = "#4DF0FF",
        red = "#f65866",
        yellow = "#fad773",
        magenta = "#ff5ef1",
        pink = "#ff5ea0",
        orange = "#f79811",
        purple = "#cd6beb",
      }

      local normalbg = "#141415"
      local promptTitleBg = "#FF9185"
      local neotreeRootFg = "#dd9046"
      local delimiterFg = "#bbc0c9"
      -- local normalbg = "#111112"
      -- local promptTitleBg = "#FF7E70"

      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        hide_fillchars = false,
        borderless_telescope = false,
        terminal_colors = true,
        theme = {
          highlights = {
            -- Terminal
            Directory = { fg = colors.blue },
            Search = { fg = normalbg, bg = "#f2cc81" },
            IncSearch = { fg = normalbg, bg = "#dd9046" },
            CurSearch = { link = "IncSearch" },
            TabLineFill = { link = "Search" },


            -- Syntax
            Constant = { fg = colors.orange },
            String = { fg = colors.green },
            Character = { fg = colors.green },
            Identifier = { fg = colors.fg },
            Function = { fg = colors.blue, style = "italic" },
            Statement = { fg = colors.purple },
            Operator = { fg = colors.fg },
            Keyword = { fg = colors.purple },
            Execption = { link = "Keyword" },
            PreProc = { link = "Keyword" },
            Type = { fg = colors.yellow },
            Special = { fg = colors.red },
            Debug = { fg = colors.orange },
            Delimiter = { fg = delimiterFg },
            Todo = { fg = colors.purple, style = "bold" },
            Number = { fg = colors.orange },
            Boolean = { fg = colors.orange },
            MatchParen = { fg = colors.fg, bg = colors.grey },


            -- Treesitter
            ["@field"] = { fg = colors.red },
            ["@constant"] = { fg = colors.orange },
            ["@operator"] = { fg = colors.fg },
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

            ["@number"] = { fg = colors.orange },

            ["@lsp.type.property"] = { fg = colors.cyan },
            ["@lsp.type.macro"] = { fg = colors.cyan },
            ["@lsp.type.parameter"] = { fg = colors.red },
            ["@lsp.typemod.variable.defaultLibrary.cpp"] = { fg = colors.red },


            -- floating window
            NormalFloat = { bg = normalbg, fg = colors.fg },
            FloatBorder = { bg = normalbg, fg = colors.bg },


            -- Telescope
            TelescopeNormal = { bg = colors.bg },
            TelescopeBorder = { fg = colors.bg, bg = colors.bg },
            TelescopeMatching = { fg = colors.orange },
            TelescopePreviewBorder = { fg = colors.bg, bg = colors.bg },
            TelescopePreviewNormal = { bg = colors.bg },
            TelescopePreviewTitle = { fg = colors.bg, bg = "#aae6b2", style = "bold" },
            TelescopePromptBorder = { fg = colors.bgAlt, bg = colors.bgAlt },
            TelescopePromptNormal = { fg = colors.fg, bg = colors.bgAlt },
            TelescopePromptPrefix = { fg = colors.grey, bg = colors.bgAlt },
            TelescopePromptTitle = { fg = colors.bg, bg = promptTitleBg, style = "bold" },
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
            NeoTreeRootName = { fg = neotreeRootFg, style = "bold" },
            NeoTreeFileName = { fg = colors.fg },
            NeoTreeGitModified = { fg = colors.yellow },
            NeoTreeGitConflict = { fg = colors.red, style = "bold,italic" },
            NeoTreeGitUntracked = { fg = colors.red, style = "italic" },
            NeoTreeSymbolicLinkTarget = { fg = colors.purple },
            NeoTreeCursorLine = { style = "bold,italic" },
            -- NeoTreeDimText = {},
            -- NeoTreeMessage = {},
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
            CmpItemAbbrMatchFuzzy = { fg = colors.orange, bg = colors.bg, style = "underline" },
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
            DiffText = { fg = colors.yellow, bg = colors.bgHighlight, style = "bold,italic" },


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

            DiagnosticUnderlineOk = { link = "DiagnosticOk", style = "undercurl" },
            DiagnosticUnderlineError = { link = "DiagnosticError", style = "undercurl" },
            DiagnosticUnderlineWarn = { link = "DiagnosticWarn", style = "undercurl" },
            DiagnosticUnderlineInfo = { link = "DiagnosticInfo", style = "undercurl" },
            DiagnosticUnderlineHint = { link = "DiagnosticHint", style = "undercurl" },


            -- Bufferline
            BufferLineSeparator = { fg = colors.grey },
            BufferLineTabSeparator = { fg = colors.grey },
            BufferLineBufferSelected = { fg = colors.fg, style = "italic" },
            BufferLineDiagnosticSelected = { fg = colors.fg, style = "italic" },
            BufferLineHintSelected = { fg = colors.purple, style = "italic" },
            BufferLineHintDiagnosticSelected = { fg = colors.purple, style = "italic" },
            BufferLineInfoSelected = { fg = colors.cyan, style = "italic" },
            BufferLineInfoDiagnosticSelected = { fg = colors.cyan, style = "italic" },
            BufferLineWarningSelected = { fg = colors.yellow, style = "italic" },
            BufferLineWarningDiagnosticSelected = { fg = colors.yellow, style = "italic" },
            BufferLineErrorSelected = { fg = colors.red, style = "italic" },
            BufferLineErrorDiagnosticSelected = { fg = colors.red, style = "italic" },
            BufferLineIndicatorSelected = { fg = colors.blue, style = "italic" },

          }
        }
      })
      vim.cmd("colorscheme cyberdream")
    end,
  },
}
