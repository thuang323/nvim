return {
  'saghen/blink.cmp',
  version = '1.*',
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "erooke/blink-cmp-latex",
    'rafamadriz/friendly-snippets',
    "onsails/lspkind.nvim",
    "echasnovski/mini.icons",
  },
  opts = {
    cmdline = { enabled = true },

    completion = {
      -- 'prefix' will fuzzy match on the text before the cursor
      -- 'full' will fuzzy match on the text before _and_ after the cursor
      -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
      keyword = { range = 'full' },

      -- some LSPs may add auto brackets themselves anyway
      accept = { auto_brackets = { enabled = true }, },

      -- Show documentation when selecting a completion item
      documentation = { auto_show = true, auto_show_delay_ms = 500 },

      -- Display a preview of the selected item on the current line
      ghost_text = { enabled = true },

      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, _ = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then return mini_icon .. ctx.icon_gap end
                end

                local icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
                return icon .. ctx.icon_gap
              end,

              highlight = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then return mini_hl end
                end
                return ctx.kind_hl
              end,
            },
            kind = {
              -- Optional, use highlights from mini.icons
              highlight = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then return mini_hl end
                end
                return ctx.kind_hl
              end,
            }
          }
        }
      },
    },

    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-c>'] = { 'hide', 'fallback' },
      ['<C-e>'] = { 'select_and_accept', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      nerd_font_variant = 'normal'
    },

    snippets = { preset = 'default' },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'latex' },
      providers = {
				latex = {
					name = "Latex",
					module = "blink-cmp-latex",
					opts = {
						-- set to true to insert the latex command instead of the symbol
						insert_command = false
					},
				},
			},
    },

    signature = { enabled = true },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" },
}
