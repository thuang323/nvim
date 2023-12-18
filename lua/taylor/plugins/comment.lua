return {
  'numToStr/Comment.nvim',
  config = function()
    local ft = require("Comment.ft")

    ft.asm = "#%s"
    require('Comment').setup()
  end,
  lazy = false,
}
