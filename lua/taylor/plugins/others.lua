return {
  { "anuvyklack/hydra.nvim" },
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
}
