return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-p>"] = actions.move_selection_previous, -- move to previous result
						["<C-n>"] = actions.move_selection_next, -- move to next result
						-- ["<C-j>"] = actions.preview_scrolling_down, -- preview window scrolling down
						-- ["<C-k>"] = actions.preview_scrolling_up, -- preview window scrolling up
						["<C-q"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap

		keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>")
		keymap.set("n", "<leader>sw", "<cmd>Telescope live_grep<cr>")
		keymap.set("n", "<leader>sg", "<cmd>Telescope grep_string<cr>")
		keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>")
		keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>")
		keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>")
		keymap.set("n", "<leader>so", "<cmd>Telescope oldfiles<cr>")
		keymap.set("n", "<leader>sh", "<cmd>Telescope highlights<cr>")
	end,
}
