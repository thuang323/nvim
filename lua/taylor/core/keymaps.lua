
vim.g.mapleader = " "

local map = require("taylor.utils.keymap").map

-- some helpful vim keybindings
-- 1. change a word with multiple occurences once in a file
--    :%s/original/new/g
-- 2. change a word with multiple occurences once in the visual line mode
--    :s/old_word/new_word/g

vim.api.nvim_create_user_command("Q", "wa | qa", {})

-- differentiate between deleting and cutting
map({ "n", "x" }, "d", "\"_d")
map({ "n", "x" }, "D", "\"_D")

map({ "n", "x" }, "c", "\"_c")
map({ "n", "x" }, "C", "\"_C")

map({ "n", "x" }, "s", "\"_s")
map({ "n", "x" }, "S", "\"_S")

map("n", "x", "d")
map("n", "X", "D")
map("n", "xx", "dd")


-- pasting
map({ "i", "c" }, "<C-v>", "<C-r>\"")
map("t", "<C-v>", "<C-\\><C-n>pi")


-- system clipboard
map({ "n", "x" }, "<leader>p", "\"+p")
map({ "n", "x" }, "<leader>P", "\"+P")

map({ "n", "x" }, "<leader>y", "\"+y")
map({ "n", "x" }, "<leader>Y", "\"+Y", { remap = true })

map({ "n", "x" }, "<leader>x", "\"+x")
map({ "n", "x" }, "<leader>X", "\"+X", { remap = true })


-- cmd line emacs
vim.cmd [[set cedit=\<C-Y>]]
map("c", "<C-a>", "<Home>")
map("c", "<C-b>", "<Left>")
map("c", "<C-d>", "<Del>")
map("c", "<C-e>", "<End>")
map("c", "<C-f>", "<Right>")
map("c", "<C-n>", "<Down>")
map("c", "<C-p>", "<Up>")
map("c", "<M-b>", "<S-Left>")
map("c", "<M-f>", "<S-Right>")


-- general keymaps
map("i", "jk", "<Esc>")

map("n", "<leader>nh", "<cmd>nohl<CR>")       -- non highlight

map("n", "<leader>tn", "<cmd>tabnew<CR>")     -- new tab in vim
map("n", "<leader>tc", "<cmd>tabclose<CR>")   -- close tab in vim
map("n", "<leader>]", "<cmd>tabnext<CR>")     -- go to next tab
map("n", "<leader>[", "<cmd>tabprevious<CR>") -- go to prev tab


map({ "i", "c" }, "<M-bs>", "<C-w>", { remap = true }) -- delete a word
map({ "i", "c" }, "<D-bs>", "<C-u>", { remap = true }) -- delete curr line up to cursor
map("x", "+", "<C-a>g")                                -- increment line of numbers
map("x", "-", "<C-x>g")                                -- decrement line of numbers


-- Function to scroll by one-fifth of the window height
local function scroll(direction)
  local count = math.floor(vim.api.nvim_win_get_height(0) / 5)
  if direction == "up" then
    vim.api.nvim_command("normal! " .. count .. "k")
  elseif direction == "down" then
    vim.api.nvim_command("normal! " .. count .. "j")
  end
end

map({ "n", "x" }, "<C-u>", function() scroll("up") end, { noremap = true, silent = true })
map({ "n", "x" }, "<C-d>", function() scroll("down") end, { noremap = true, silent = true })


-- indentation
map("i", "<D-[>", "<C-d>")
map("i", "<D-]>", "<C-t>")
map("n", "<D-[>", "<<")
map("n", "<D-]>", ">>")
map("x", "<D-[>", "<gv")
map("x", "<D-]>", ">gv")


-- quickfix jump
map("n", "<C-j>", "<cmd>cnext<CR>")
map("n", "<C-k>", "<cmd>cprev<CR>")


-- word change
map({ "n", "x" }, "<leader>cn", "*Ncgn", { remap = true })
map({ "n", "x" }, "<leader>cN", "*NcgN", { remap = true })


-- telescope
map("n", "<D-p>", "<cmd>Telescope<cr>")
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>")
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>sw", "<cmd>Telescope grep_string<cr>")
map("n", "<leader>sb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>")
map("n", "<leader>so", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>sh", "<cmd>Telescope highlights<cr>")
map("n", "<leader>st", "<cmd>TodoTelescope<cr>")


-- comment
map("n", "<D-/>", "<Plug>(comment_toggle_linewise_current)")
map("x", "<D-/>", "<Plug>(comment_toggle_linewise_visual)")
-- `gco` - Insert comment to the next line and enters INSERT mode
-- `gcA` - Insert comment to end of the current line and enters INSERT mode
-- `gcw` - Toggle from the current cursor position to the next word
-- `gc}` - Toggle until the next blank line
-- `gca{` - Toggle around curly brackets
-- `gci{` - Toggle inside curly brackets


-- toggleterm
map("t", "<M-v>", "<C-\\><C-n>")
map("t", "<C-w>", "<C-\\><C-n><C-w>")
map({ "n", "t" }, "<D-j>", "<cmd>ToggleTerm<CR>")


-- neo-tree
map("n", "<leader>eo", "<cmd>Neotree toggle<CR>")
map("n", "<D-b>", "<cmd>Neotree toggle<CR>")
map("n", "<leader>ef", "<cmd>Neotree focus<CR>")
map("n", "<leader>er", "<cmd>Neotree reveal<CR>")


-- trouble
map("n", "<leader>tf", "<cmd>Trouble<CR>")
-- map("n", "<leader>td", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<CR>")
map("n", "<leader>td", "<cmd>Trouble diagnostics split toggle focus=true filter.buf=0<CR>")
map("n", "<leader>ts", "<cmd>Trouble symbols<CR>")


-- undo-tree
map("n", "<leader>u", vim.cmd.UndotreeToggle)


-- whichkey
map("n", "<leader>?", "<cmd>WhichKey<CR>")


-- LazyUI
map("n", "<leader>L", "<cmd>Lazy<CR>")


-- LiveServer
-- map("n", "<leader>ls", "<cmd>LiveServerStart<CR>")
-- map("n", "<leader>le", "<cmd>LiveServerStop<CR>")


-- Colortils
-- map("n", "<leader>cp", "<cmd>Colortils picker<CR>")
-- map("n", "<leader>cl", "<cmd>Colortils css list<CR>")


-- hydra mapping
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


-- file switch
if vim.g.neogurt then
  map("n", "<C-->", "<C-^>")
else
  map("n", "<C-_>", "<C-^>")
end


if vim.g.neogurt then
  map({ "i", "c" }, "<D-v>", "<C-r>+")
  map("t", "<D-v>", "<C-\\><C-n>\"+pi")
  map({ "i", "c", "t" }, "<D-bs>", "<C-u>")
end

-- neogurt
if vim.g.neogurt then
  -- all modes
  local mode = {"", "!", "t", "l"};
  map(mode, "<D-=>", "<cmd>Neogurt font_size_change 1<cr>")
  map(mode, "<D-->", "<cmd>Neogurt font_size_change -1<cr>")
  map(mode, "<D-0>", "<cmd>Neogurt font_size_reset<cr>")

  map(mode, "<D-l>", "<cmd>Neogurt session_prev<cr>")
  map(mode, "<D-r>", "<cmd>Neogurt session_select sort=time<cr>")

  map(mode, "<D-f>", function()
    local cmd = [[
    echo "$({
      echo ~/;
      echo ~/resume/;
      echo ~/dotfiles/;
      echo ~/.config/nvim/;
      find ~/Purdue -maxdepth 3 -type d;
      find ~/coding -maxdepth 2 -type d \( -path '*/.git' -o -path '*/.undodir' \) -prune -o -type d -print;
      find ~/dotfiles -mindepth 1 -maxdepth 3 -type d \( -path '*/.git' -o -path '*/.undodir' \) -prune -o -type d -print;
    })"
    ]]
    local output = vim.fn.system(cmd)

    local dirs = {}
    for dir in string.gmatch(output, "([^\n]+)") do
      table.insert(dirs, dir)
    end

    vim.ui.select(dirs, {
      prompt = "Choose a directory:",
    }, function(choice)
      if choice == nil then return end
      local dir = choice
      local fmod = vim.fn.fnamemodify
      local name = fmod(fmod(dir, ":h"), ":t") .. "/" .. fmod(dir, ":t")
      vim.g.neogurt_cmd("session_new", { dir = dir, name = name })
    end)
  end)

  vim.g.neogurt_startup = function()
    local cmd = [[
    echo "$({
      echo ~/;
      echo ~/resume/;
      echo ~/dotfiles/;
      echo ~/.config/nvim/;
      find ~/Purdue -maxdepth 3 -type d;
      find ~/coding -maxdepth 2 -type d \( -path '*/.git' -o -path '*/.undodir' \) -prune -o -type d -print;
      find ~/dotfiles -mindepth 1 -maxdepth 3 -type d \( -path '*/.git' -o -path '*/.undodir' \) -prune -o -type d -print;
    })"
    ]]
    local output = vim.fn.system(cmd)

    local dirs = {}
    for dir in string.gmatch(output, "([^\n]+)") do
      table.insert(dirs, dir)
    end

    vim.ui.select(dirs, {
      prompt = "Choose a directory:",
    }, function(choice)
      if choice == nil then return end
      local dir = choice
      local fmod = vim.fn.fnamemodify
      local name = fmod(fmod(dir, ":h"), ":t") .. "/" .. fmod(dir, ":t")
      vim.g.neogurt_cmd("session_new", { dir = dir, name = name, switch_to = false })
      vim.g.neogurt_cmd("session_kill")
    end)
  end
end
