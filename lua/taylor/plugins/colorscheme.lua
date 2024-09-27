return {
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
      -- local normalbg = "#111112"
      -- local promptTitleBg = "#FF7E70"

      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        hide_fillchars = false,
        borderless_telescope = false,
        terminal_colors = true,
        -- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
        -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
        cache = false,
        theme = {
          highlights = {
            -- Terminal
            Directory = { fg = colors.blue },
            Search = { fg = normalbg, bg = "#f2cc81" },
            IncSearch = { fg = normalbg, bg = "#dd9046" },
            CurSearch = { link = "IncSearch" },
            -- CursorLine = { bg = "#29292b" },
            CursorLine = { bg = "#252527" },
            TabLineFill = { link = "Search" },


            -- Syntax
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
            Delimiter = { fg = delimiterFg },
            Todo = { fg = colors.purple, bold = true },
            Number = { fg = colors.orange },
            Boolean = { fg = colors.orange },
            -- MatchParen = { fg = colors.fg, bg = colors.grey },
            MatchParen = { fg = colors.purple },


            -- Treesitter
            ["@field"] = { fg = colors.red },
            ["@constant"] = { fg = colors.orange },
            -- ["@operator"] = { fg = colors.fg },
            ["@operator"] = { fg = "#32d7e6" },
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
            ["@lsp.type.bracket"] = { fg = colors.purple },
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
            ["@lsp.type.variable.javascript"] = { fg = colors.red },
            ["@punctuation.special.javascript"] = { fg = colors.orange },
            ["@tag.builtin.javascript"] = { fg = colors.blue },
            ["@tag.javascript"] = { fg = colors.red },
            ["@odp.operator.fat_arrow.javascript"] = { fg = colors.purple },
            ["@odp.statement.punctuation.bracket.javascript"] = { fg = colors.purple },

            -- typescript highlights
            ["@variable.typescript"] = { fg = colors.red },
            ["@variable.tsx"] = { fg = colors.red },
            ["@lsp.type.variable.typescriptreact"] = { fg = colors.red },
            ["@lsp.type.variable.typescript"] = { fg = colors.red },
            ["@tag.builtin.tsx"] = { fg = colors.blue },
            ["@punctuation.special.typescript"] = { fg = colors.orange },
            ["@type.builtin.typescript"] = { fg = colors.yellow },
            ["@variable.builtin.typescript"] = { fg = colors.yellow },
            ["@odp.operator.fat_arrow.typescript"] = { fg = colors.purple },
            -- ["@odp.property.function.typescript"] = { link = "@function.typescript" },
            ["@lsp.type.typeParameter.typescript"] = { fg = colors.yellow },

            -- json/jsonc highlights
            ["@property.json"] = { fg = colors.red },
            ["@odp.braces.json"] = { fg = colors.purple },
            ["@property.jsonc"] = { fg = colors.red },
            ["@odp.braces.jsonc"] = { fg = colors.purple },

            -- cpp highlights
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
            DiffText = { fg = colors.yellow, bg = colors.bgHighlight, bold = true, italic = true },


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
          }
        }
      })

      vim.cmd("colorscheme cyberdream")
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      -- colorschemes
      local utils = require("taylor.utils.colors")

      local color = require("onedarkpro.helpers")
      local colors = color.get_colors()


      require("onedarkpro").setup({
        plugins = {
          all = false,
          treesitter = true,
          nvim_lsp = true,
          lsp_semantic_tokens = true,
          -- diffview = true,
        },
        options = {
          transparency = true,
        },
        highlights = {
          NormalFloat = { bg = colors.float_bg },
          FloatBorder = { bg = colors.float_bg, fg = colors.gray },

          -- Editor
          MatchParen = { fg = "NONE", bg = colors.selection },
          Search = { fg = colors.bg, bg = colors.yellow },
          IncSearch = { fg = colors.bg, bg = colors.orange },
          Cursor = { fg = colors.black, bg = colors.white },
          TermCursor = { fg = colors.black, bg = colors.white },
          CursorLine = { bg = colors.color_column },
          CursorLineNr = { fg = colors.fg },
          TabLineSel = { fg = colors.bg, bg = colors.fg },
          SpecialKey = { fg = colors.comment },
          LineNr = { fg = colors.gray },

          -- Syntax
          PreProc = { fg = colors.purple },
          Include = { fg = colors.purple },
          Operator = { fg = colors.white },
          Macro = { fg = colors.orange },
          PreCondit = { fg = colors.purple },
          StorageClass = { fg = colors.purple },
          Structure = { fg = colors.yellow },

          -- Treesitter
          ["@field"] = { fg = colors.red },
          ["@type"] = { link = "Type" },
          ["@type.builtin"] = { fg = colors.purple },
          ["@type.definition"] = { fg = colors.purple },
          ["@type.qualifier"] = { fg = colors.purple },
          ["@constant.builtin"] = { link = "@constant" },
          ["@function.builtin"] = { fg = colors.cyan },
          ["@punctuation.bracket"] = { fg = colors.fg },

          ["@lsp.type.struct.rust"] = { fg = colors.yellow },

          ["@lsp.type.comment"] = {},

          ["@field.lua"] = { fg = colors.red },
          ["@parameter.lua"] = { fg = colors.red, style = "italic" },
          ["@lsp.typemod.variable.defaultLibrary.lua"] = { fg = colors.red },

          ["@include.python"] = { fg = colors.purple },
          ["@type.builtin.python"] = { link = "@type" },
          ["@type.definition.python"] = { link = "@type" },
          ["@type.qualifier.python"] = { link = "@type" },

          ["@operator"] = { fg = colors.white },

          ["@type.c"] = { fg = colors.purple },
          ["@operator.c"] = { fg = colors.white },

          ["@operator.cpp"] = { fg = colors.white },
          ["@lsp.typemod.variable.readonly.cpp"] = {},

          ["@text.reference"] = { fg = colors.red },
          ["@text.literal"] = { link = "Comment" },
          ["@text.todo.unchecked"] = {},
          ["@text.todo.checked"] = {},
          ["@text.literal.block.markdown"] = {},

          -- TreesitterContext = { bg = colors.selection},

          -- Lsp
          DiagnosticError = { fg = colors.red },
          DiagnosticWarn = { fg = colors.yellow },
          DiagnosticInfo = { fg = colors.blue },
          DiagnosticHint = { fg = colors.purple },

          DiagnosticSignError = { fg = colors.red },
          DiagnosticSignWarn = { fg = colors.yellow },
          DiagnosticSignInfo = { fg = colors.blue },
          DiagnosticSignHint = { fg = colors.purple },

          DiagnosticUnderlineError = { fg = "NONE", sp = colors.red, style = "undercurl" },
          DiagnosticUnderlineWarn = { fg = "NONE", sp = colors.yellow, style = "undercurl" },
          DiagnosticUnderlineInfo = { fg = "NONE", sp = colors.blue, style = "underdashed" },
          DiagnosticUnderlineHint = { fg = "NONE", sp = colors.purple, style = "underdotted" },
          DiagnosticDeprecated = { fg = "NONE", sp = colors.purple, style = "underdotted" },

          DiagnosticVirtualTextError = { fg = colors.red, bg = utils.darken(colors.red, 0.1, colors.bg) },
          DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = utils.darken(colors.yellow, 0.1, colors.bg) },
          DiagnosticVirtualTextInfo = { fg = colors.blue, bg = utils.darken(colors.blue, 0.1, colors.bg) },
          DiagnosticVirtualTextHint = { fg = colors.purple, bg = utils.darken(colors.purple, 0.1, colors.bg) },

          -- DiagnosticVirtualTextError = { fg = colors.red },
          -- DiagnosticVirtualTextWarn = { fg = colors.yellow },
          -- DiagnosticVirtualTextInfo = { fg = colors.blue },
          -- DiagnosticVirtualTextHint = { fg = colors.purple },

          LspSignatureActiveParameter = { fg = colors.orange, style = "bold" },

          -- Neo-tree
          NeoTreeRootName = { fg = colors.orange, style = "bold" },
          NeoTreeGitAdded = { fg = colors.green },
          NeoTreeGitDeleted = { fg = colors.red },
          NeoTreeGitModified = { fg = colors.yellow },
          NeoTreeGitConflict = { fg = colors.red, style = "bold,italic" },
          NeoTreeGitUntracked = { fg = colors.red, style = "italic" },
          NeoTreeIndentMarker = { fg = colors.gray },
          NeoTreeSymbolicLinkTarget = { fg = colors.purple },

          -- Diff
          diffAdded = { fg = colors.green },
          diffChanged = { fg = colors.yellow },
          diffRemoved = { fg = colors.red },

          DiffAdd = { bg = utils.darken(colors.git_add, 0.4, colors.bg) },
          DiffText = { bg = utils.darken(colors.git_add, 0.4, colors.bg) },
          DiffChange = { bg = utils.darken(colors.git_change, 0.4, colors.bg) },
          DiffDelete = { bg = utils.darken(colors.git_delete, 0.4, colors.bg) },

          DiffviewFolderSign = { fg = colors.blue },
          DiffviewFilePanelFileName = { fg = colors.fg },
          DiffviewFilePanelTitle = { fg = colors.orange, style = "bold" },
          DiffviewFilePanelCounter = { fg = colors.fg },
          DiffviewHash = { fg = colors.yellow },

          -- Neogit
          NeogitDiffAdd = { fg = colors.fg, bg = colors.diff_add },
          NeogitDiffDelete = { bg = colors.diff_delete },
          -- NeogitDiffAdd = { fg = colors.green,  },
          -- NeogitDiffDelete = { fg = colors.red },

          NeogitHunkHeaderHighlight = { fg = colors.bg, bg = colors.fg, style = "bold" },
          NeogitDiffAddHighlight = { fg = colors.fg, bg = colors.diff_add },
          NeogitDiffDeleteHighlight = { bg = colors.diff_delete },
          -- NeogitDiffAddHighlight = { fg = colors.green },
          -- NeogitDiffDeleteHighlight = { fg = colors.red },

          NeogitBranch = { fg = colors.yellow, style = "bold" },
          NeogitRemote = { fg = colors.green, style = "bold" },

          NeogitSectionHeader = { fg = colors.purple, style = "bold" },
          NeogitChangeModified = { fg = colors.purple, style = "bold" },

          -- Telescope
          TelescopeNormal = { fg = colors.fg, bg = colors.float_bg },
          TelescopeBorder = { fg = colors.gray, bg = colors.float_bg },

          TelescopePromptNormal = { fg = colors.fg, bg = colors.fg_gutter },
          TelescopePromptBorder = { fg = colors.fg, bg = colors.fg_gutter },
          TelescopePromptTitle = { fg = colors.float_bg, bg = colors.red },
          TelescopePromptCounter = { fg = colors.gray, bg = colors.fg_gutter },

          TelescopeResultsTitle = { fg = colors.float_bg, bg = colors.float_bg },

          TelescopePreviewTitle = { fg = colors.float_bg, bg = colors.green },

          TelescopeMatching = { fg = colors.orange, style = "bold" },

          TelescopeDirectoryCustom = { fg = colors.comment },

          -- Alpha
          AlphaHeader = { fg = colors.orange },
          AlphaButtons = { fg = colors.purple },

          -- Tagbar
          TagbarHighlight = { fg = colors.orange, style = "bold" },
          TagbarScope = { fg = colors.yellow },
          TagbarType = { fg = colors.purple },

          FloatTitle = { fg = colors.bg, bg = colors.green },

          QuickFixLine = { bg = colors.color_column, style = "bold,italic" },
          qfLineNr = { fg = colors.comment },
        },
        styles = {
          types = "NONE",
          methods = "NONE",
          numbers = "NONE",
          strings = "NONE",
          comments = "NONE",
          keywords = "NONE",
          constants = "NONE",
          functions = "NONE",
          operators = "NONE",
          variables = "NONE",
          parameters = "italic",
          conditionals = "NONE",
          virtual_text = "NONE",
        },
      })

      -- vim.cmd("colorscheme onedark")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      require("nvim-web-devicons").refresh()
      vim.opt.background = "light"

      require("tokyonight").setup({
        style = "day",
        transparent = false,
        -- transparent = true,
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark",  -- style for sidebars, see below
          floats = "dark",    -- style for floating windows
        },
        day_brightness = 0.4, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        dim_inactive = false, -- dims inactive windows
        lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
        cache = false,
        on_highlights = function(highlights, colors)
          highlights.AlphaHeader = { link = "Constant" }
        end,
      })

      -- vim.cmd("colorscheme tokyonight")
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.opt.background = "dark"
      require("nvim-web-devicons").refresh()
      vim.opt.background = "light"

      require("rose-pine").setup({
        variant = "auto",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true,        -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
        highlight_groups = {
          AlphaHeader = { link = "@function.builtin" }
        }
      })

      -- vim.cmd("colorscheme rose-pine")
    end
  },
}
