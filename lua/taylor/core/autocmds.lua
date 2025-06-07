-- nohlsearch when cursor moves or enters insert mode
vim.cmd([[
noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

fu! HlSearch()
    let s:pos = match(getline('.'), @/, col('.') - 1) + 1
    if s:pos != col('.')
        call StopHL()
    endif
endfu

fu! StopHL()
    if !v:hlsearch || mode() isnot 'n'
        return
    else
        sil call feedkeys("\<Plug>(StopHL)", 'm')
    endif
endfu

augroup taylor_search_highlight
au!
    au CursorMoved * call HlSearch()
    au InsertEnter * call StopHL()
augroup end
]])

-- go to last loc when opening a buffer
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
	group = lastplace,
	pattern = { "*" },
	desc = "remember last cursor place",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- go to last loc for harpoon
-- local harpoon = require("harpoon")
-- vim.api.nvim_create_autocmd({ "BufLeave", "ExitPre" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		local filename = vim.fn.expand("%:p:.")
-- 		local harpoon_marks = harpoon:list().items
-- 		for _, mark in ipairs(harpoon_marks) do
-- 			if mark.value == filename then
-- 				mark.context.row = vim.fn.line(".")
-- 				mark.context.col = vim.fn.col(".")
-- 				return
-- 			end
-- 		end
-- 	end,
-- })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			-- higroup = "Visual",
			timeout = 200,
		})
	end,
})

-- LuaSnip supertab fix
-- vim.api.nvim_create_autocmd("ModeChanged", {
--   group = vim.api.nvim_create_augroup("taylor_clear_supertab", {}),
--   pattern = "*",
--   callback = function()
--     if ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
--       and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--       and not require("luasnip").session.jump_active
--     then
--       require("luasnip").unlink_current()
--     end
--   end,
-- })
