return {
	{
		"nvimtools/hydra.nvim",
		config = function()
			local Hydra = require("hydra")

			Hydra({
				name = "windowsResize",
				mode = "n",
				body = "<C-w>",
				heads = {
					{ "+", "<C-w>+" },
					{ "-", "<C-w>-" },
					{ "<", "<C-w>3<" },
					{ ">", "<C-w>3>" },
				},
			})
		end,
	},
}
