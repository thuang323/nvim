return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      -- enable syntax highlighting
      highlight = {
        enable = true,
        disable = {
          "csv",
          "dockerfile",
          "ini",
        },
      },
      indent = { enable = true },       -- enable indentation
      ensure_installed = {              -- ensure these language parsers are installed
        "python",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "vue",
        "html",
        "css",
        "lua",
        "c",
        "cpp",
        "java",
        "c_sharp",
        "markdown",
        "markdown_inline",
        "gitignore",
      },
      -- auto install above language parsers
      auto_install = true,
    })
  end,
}
