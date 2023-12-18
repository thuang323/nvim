return {
  'numToStr/Comment.nvim',
  config = function()

    local ft = require("Comment.ft")

    -- change assembly comment to #
    ft.asm = "#%s"
    require('Comment').setup()
  end,
  lazy = false,
}
