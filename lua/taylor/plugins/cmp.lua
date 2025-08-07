return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "kdheepak/cmp-latex-symbols",       -- latex symbol
    "hrsh7th/cmp-buffer",               -- source for text in buffer
    "hrsh7th/cmp-cmdline",              -- source for cmdline completions
    "hrsh7th/cmp-path",                 -- source for file system paths
    "L3MON4D3/LuaSnip",                 -- snippet engine
    "saadparwaiz1/cmp_luasnip",         -- for autocompletion
    "rafamadriz/friendly-snippets",     -- useful snippets
    "tailwind-tools",                   -- tailwind
    "onsails/lspkind.nvim",             -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local compare = require("cmp.config.compare")


    -- load friendly-snippets
    require("luasnip/loaders/from_vscode").lazy_load()
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "none",
          -- winhighlight = "Normal:FloatShadowThrough,FloatBorder:Title,CursorLine:DiffText,Search:None",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:DiffText,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          border = "none",
          -- winhighlight = "Normal:FloatShadowThrough,FloatBorder:Title,Search:None",
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None",
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-c>"] = cmp.mapping.abort(),         -- close completion window
        ["<C-e>"] = cmp.mapping.confirm({ select = false }),


        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),


        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },         -- lsp
        { name = "luasnip" },          -- snippets
        { name = "buffer" },           -- text within current buffer
        { name = "path" },             -- file system paths
      }),

      sorting = {
        comparators = {
          compare.extract,
          compare.recently_used,
        },
      },

      -- configure lspkind for vs-code like icons
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[Latex]",
          },
          before = require("tailwind-tools.cmp").lspkind_format,
        }),
      },
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype("tex", {
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        {
          name = "latex_symbols",
          option = {
            strategy = 2,             -- latex
          },
        },
      }),
    })

    cmp.setup.filetype("txt", {
      sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
