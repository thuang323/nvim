return {
  "folke/trouble.nvim",
  dependencies = { "echasnovski/mini.icons" },
  cmd = "Trouble",
  config = function()
    local trouble = require("trouble")
    trouble.setup({
      keys = {
        ["?"] = "help",
        r = "refresh",
        R = "toggle_refresh",
        q = "close",
        o = "jump_close",
        ["<esc>"] = "cancel",
        l = "jump",
        ["<2-leftmouse>"] = "jump",
        ["<c-s>"] = "jump_split",
        ["<c-v>"] = "jump_vsplit",
        ["}"] = "next",
        ["]]"] = "next",
        ["{"] = "prev",
        ["[["] = "prev",
        dd = "delete",
        d = { action = "delete", mode = "v" },
        i = "inspect",
        p = "preview",
        P = "toggle_preview",
        zo = "fold_open",
        zO = "fold_open_recursive",
        zc = "fold_close",
        zC = "fold_close_recursive",
        za = "fold_toggle",
        zA = "fold_toggle_recursive",
        zm = "fold_more",
        zM = "fold_close_all",
        zr = "fold_reduce",
        zR = "fold_open_all",
        zx = "fold_update",
        zX = "fold_update_all",
        zn = "fold_disable",
        zN = "fold_enable",
        zi = "fold_toggle_enable",
        gb = { -- example of a custom action that toggles the active view filter
          action = function(view)
            view:filter({ buf = 0 }, { toggle = true })
          end,
          desc = "Toggle Current Buffer Filter",
        },
        s = { -- example of a custom action that toggles the severity
          action = function(view)
            local f = view:get_filter("severity")
            local severity = ((f and f.filter.severity or 0) + 1) % 5
            view:filter({ severity = severity }, {
              id = "severity",
              template = "{hl:Title}Filter:{hl} {severity}",
              del = severity == 0,
            })
          end,
          desc = "Toggle Severity Filter",
        },
      },
      modes = {
        split = {
          mode = "diagnostics",
          focus = true,
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.5,
          },
        },
        symbols = {
          desc = "document symbols",
          mode = "lsp_document_symbols",
          focus = true,
          win = {
            position = "right",
            size = 0.18,
          },
        },
        todos = {
          mode = "todo",
          filter = {
            tag = {
              "TODO",
              "FIX",
              "BUG"
            }
          },
          focus = true,
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.5,
          },
        }
      },

    })
  end,
  keys = {
    { "<leader>tf", "<cmd>Trouble<cr>",                                                  desc = "Trouble Menu" },
    { "<leader>td", "<cmd>Trouble diagnostics split toggle focus=true filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>tt", "<cmd>Trouble todos<CR>",                                            desc = "Todo Tasks (Trouble)" },
    { "<leader>ts", "<cmd>Trouble symbols<cr>",                                          desc = "Symbols (Trouble)" },
  },
}
