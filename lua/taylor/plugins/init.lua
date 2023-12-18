return {
  -- some essential plugins that don't have to do extra config
  "nvim-lua/plenary.nvim",
  "christoomey/vim-tmux-navigator",
  "anuvyklack/hydra.nvim",
  "tpope/vim-surround",
  -- vim-surround stuff
  -- ys: can use it to surround with the characters you want
  -- ds: can delete the characters surround
  -- cs: change the characteres surrounw
	"vim-scripts/ReplaceWithRegister", -- grw: can paste the word you have copied
  "mbbill/undotree", -- undo tree
  { "lewis6991/gitsigns.nvim", config = true },
  "stevearc/dressing.nvim", -- better UI for telescope
}
