return {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    local ft = require("Comment.ft")

    -- change assembly comment to #
    ft.asm = "#%s"
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
  lazy = false,
}
