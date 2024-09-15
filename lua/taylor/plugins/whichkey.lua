return {
	"folke/which-key.nvim",
	config = function()
		local which_key = require("which-key")

		which_key.setup({
      preset = "modern", -- false | classic | modern | helix
			triggers = {},
		})
	end,
}
