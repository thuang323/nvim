return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "echasnovski/mini.icons",
  config = function()
    -- mini.icons
    require("mini.icons").setup()
    require("mini.icons").mock_nvim_web_devicons()

    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "tabs",
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold,
        },
        themable = true,
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon", -- icon, underline, none
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            -- padding = 1,
            separator = true,
          },
        },
        -- buffer_close_icon = "󰅖",
        buffer_close_icon = " ",
        modified_icon = "● ",
        close_icon = " ",
        left_trunc_marker = " ",
        right_trunc_marker = " ",
        diagnostics = "nvim_lsp", -- nvim_lsp
        diagnostics_indicator = function(count, level)
          local signs = { error = " ", warning = " ", hint = "󰌵 ", info = " " }
          return " " .. signs[level] .. " " .. count
        end,
        separator_style = "thin", -- slant, slope, thick, thin
        tab_size = 21,
        show_close_icon = false,
        show_tab_indicators = false,
        show_duplicate_prefix = false,
        enforce_regular_tabs = true,
        always_show_bufferline = false,
      },
    })
  end,
}
