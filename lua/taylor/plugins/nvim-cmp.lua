return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "kdheepak/cmp-latex-symbols", -- latex symbol
    "hrsh7th/cmp-buffer", -- source for text in buffer
	  "hrsh7th/cmp-cmdline", -- source for cmdline completions
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local lua_snip = require("luasnip")
    local lspkind = require("lspkind")
    local compare = require("cmp.config.compare")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

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
          winhighlight = "Normal:FloatShadowThrough,FloatBorder:Title,CursorLine:DiffText,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          border = "none",
          winhighlight = "Normal:FloatShadowThrough,FloatBorder:Title,Search:None",
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-c>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
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
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
        {
          name = "latex_symbols",
          option = {
            strategy = 0, -- mixed
          },
        },
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
          maxwidth = 50,
          ellipsis_char = "...",
          mode = "symbol_text",
          -- menu = {
          -- 	buffer = "[Buffer]",
          -- 	nvim_lsp = "[LSP]",
          -- 	luasnip = "[LuaSnip]",
          -- 	nvim_lua = "[Lua]",
          -- 	latex_symbols = "[Latex]",
          -- },
        }),
      },
    })
  end,
}
