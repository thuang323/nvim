return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      size = 20,
      -- open_mapping = [[<C-/>]],
      open_mapping = [[<C-\>]],
      persist_size = true,
      direction = "float",
      close_on_exit = true, -- close the terminal window when the process exits
      highlights = {
        NormalFloat = {
          -- link = "NormalFloat",
          link = "TelescopeNormal",
        },
        FloatBorder = {
          -- link = "NormalFloat",
          link = "TelescopeNormal",
        },
      },
      float_opts = {
        border = "solid",
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end,
}
