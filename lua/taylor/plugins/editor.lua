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
    version = "*",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- FIX:  sdfasdfsfsf
      -- TODO: sdfasdfsfsf
      -- HACK: sdfasdfsfsf
      -- WARN: sdfasdfsfsf
      -- PERF: sdfasdfsfsf
      -- NOTE: sdfasdfsfsf
      -- TEST: sdfasdfsfsf
      keywords = {
        FIX = {
          icon = " ",
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = {  "#10B981" },
        default = { "#7C3AED" },
        test = { "#FF00FF" }
      },
    }
  }
}
