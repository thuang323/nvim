return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false, -- Recommended

        dependencies = {
            -- You will not need this if you installed the
            -- parsers manually
            -- Or if the parsers are in your $RUNTIMEPATH
            -- "nvim-treesitter/nvim-treesitter",

            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            local markview = require("markview")
            local preset = require("markview.presets");

            markview.setup({
                preview = {
                    modes = { "n", "no", "c" }, -- Change these modes
                    -- to what you need

                    hybrid_modes = { "n" }, -- Uses this feature on
                    -- normal mode

                    -- This is nice to have
                    callbacks = {
                        on_enable = function(_, win)
                            vim.wo[win].conceallevel = 2;
                            vim.wo[win].concealcursor = "c";
                        end
                    }
                },

                markdown = {
                    headings = preset.headings.glow,
                },
            })
        end
    }
}
