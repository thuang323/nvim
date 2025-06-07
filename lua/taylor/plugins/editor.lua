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
}
