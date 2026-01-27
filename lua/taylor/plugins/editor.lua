return {
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      local ft = require("Comment.ft")

      -- change assembly comment to #
      ft.asm = "#%s"
      require("Comment").setup({
        mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = false,
        },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },
  {
    "tpope/vim-surround",
    -- ys: can use it to surround with the characters you want
    -- ds: can delete the characters surround
    -- cs: change the characteres surrounw
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      opts = {
        -- Defaults
        enable_close = true,             -- Auto close tags
        enable_rename = true,            -- Auto rename pairs of tags
        enable_close_on_slash = false,   -- Auto close on trailing </
      },
      per_filetype = {
        ["html"] = {
          enable_close = false
        }
      }
    },
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({
        query = {
          javascript = "rainbow-delimiters-react", -- rainbow-delimiters-react, rainbow-parens, rainbow-tags
        },
      })
    end
  },
  {
    'saghen/blink.pairs',
    version = '*',
    dependencies = 'saghen/blink.download',
    opts = {
      mappings = {
        enabled = true,
        cmdline = true,
        disabled_filetypes = {},
        pairs = {},
      },
      highlights = {
        enabled = false,
        -- requires require('vim._extui').enable({}), otherwise has no effect
        cmdline = true,
        groups = {
          'BlinkPairsOrange',
          'BlinkPairsPurple',
          'BlinkPairsBlue',
        },
        unmatched_group = 'BlinkPairsUnmatched',

        -- highlights matching pairs under the cursor
        matchparen = {
          enabled = false,
          cmdline = false,
          include_surrounding = false,
          group = 'BlinkPairsMatchParen',
          priority = 250,
        },
      },
      debug = false,
    }
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,      -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",         -- The gui style to use for the fg highlight group.
        -- bg = "BOLD",         -- The gui style to use for the bg highlight group.
        bg = "NONE",         -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true,                -- enable multine todo comments
        multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
        before = "",                     -- "fg" or "bg" or empty
        keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg",                    -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,            -- uses treesitter to match keywords in comments only
        max_line_len = 400,              -- ignore lines longer than this
        exclude = {},                    -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]],
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    }
  }
}
