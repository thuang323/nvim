-- -- disable highlight when cursor moves
-- vim.api.nvim_set_keymap("n", "<Plug>(StopHL)", "execute('nohlsearch')[-1]", { noremap = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<Plug>(StopHL)", "execute('nohlsearch')[-1]", { noremap = true, expr = true })
--
-- function HlSearch()
-- 	local pos = vim.fn.match(vim.fn.getline("."), vim.fn.getreg("/"), vim.fn.col(".") - 1) + 1
-- 	if pos ~= vim.fn.col(".") then
-- 		StopHL()
-- 	end
-- end
--
-- function StopHL()
-- 	if not vim.v.hlsearch or vim.fn.mode() ~= "n" then
-- 		return
-- 	else
-- 		vim.cmd([[silent! call feedkeys("\<Plug>(StopHL)", 'm')]])
-- 	end
-- end
--
-- local searchHighlightGrp = vim.api.nvim_create_augroup("SearchHighlight", { clear = true })
-- vim.api.nvim_create_autocmd({ "CursorMoved" }, { group = searchHighlightGrp, pattern = "*", callback = HlSearch })
-- vim.api.nvim_create_autocmd({ "InsertEnter" }, { group = searchHighlightGrp, pattern = "*", callback = StopHL })
--
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
