return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			size = 20,
			open_mapping = [[<C-/>]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_terminals = false,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			persist_size = true,
			direction = "float",
			close_on_exit = true, -- close the terminal window when the process exits
			highlights = {
				Normal = {
					guifg = "",
					guibg = "",
				},
				NormalFloat = {
					link = "FloatShadowThrough",
				},
			},
			float_opts = {
				border = "none",
				winblend = 0,
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			vim.keymap.set("t", "<esc>", [[<C-/><C-n>]], opts)
			-- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			-- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-/><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
	end,
}
