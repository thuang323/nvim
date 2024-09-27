return {
  -- some essential plugins that don't have to do extra config
  "nvim-lua/plenary.nvim",
  "norcalli/nvim-colorizer.lua",
  "anuvyklack/hydra.nvim",
  -- "stevearc/dressing.nvim", -- better UI for telescope
  "tpope/vim-surround",     -- vim-surround stuff
  -- ys: can use it to surround with the characters you want
  -- ds: can delete the characters surround
  -- cs: change the characteres surrounw
  "vim-scripts/ReplaceWithRegister",                                     -- grw: can paste the word you have copied
  { "lewis6991/gitsigns.nvim", config = true },
  { "kdheepak/lazygit.nvim",   dependencies = "nvim-lua/plenary.nvim" }, -- lazygit
  {
    -- vimtex:
    -- <localleader> ll -> to compile
    -- <localleader> lv -> to view
    -- <localleader> lk -> to stop
    "lervag/vimtex",
    lazy = false,
    ft = "tex",
    config = function()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_format_enabled = 1
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
