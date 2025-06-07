return {
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                variant = "auto",
                transparent = true,
                saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
                italic_comments = true,
                hide_fillchars = false,
                borderless_pickers = true, -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
                terminal_colors = true,
                cache = false,

                -- Override highlight groups with your own colour values
                highlights = {
                    -- Highlight groups to override, adding new groups is also possible
                    -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

                    -- Example:
                    -- Comment = { fg = "#696969", bg = "NONE", italic = true },

                    -- More examples can be found in `lua/cyberdream/extensions/*.lua`
                },

                -- Override a highlight group entirely using the built-in colour palette
                -- overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
                --     -- Example:
                --     return {
                --         Comment = { fg = colors.green, bg = "NONE", italic = true },
                --         ["@property"] = { fg = colors.magenta, bold = true },
                --     }
                -- end,

                -- Override colors
                colors = {
                    -- For a list of colors see `lua/cyberdream/colours.lua`

                    -- Override colors for both light and dark variants
                    -- bg = "#000000",
                    -- green = "#00ff00",
                    --
                    -- -- If you want to override colors for light or dark variants only, use the following format:
                    -- dark = {
                    --     magenta = "#ff00ff",
                    --     fg = "#eeeeee",
                    -- },
                    -- light = {
                    --     red = "#ff5c57",
                    --     cyan = "#5ef1ff",
                    -- },
                },

                -- Disable or enable colorscheme extensions
                extensions = {
                    markview = false,
                },
            })
            vim.cmd("colorscheme cyberdream")
        end
    },
}
