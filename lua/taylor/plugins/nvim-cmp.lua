return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "kdheepak/cmp-latex-symbols",   -- latex symbol
    "hrsh7th/cmp-buffer",           -- source for text in buffer
    "hrsh7th/cmp-cmdline",          -- source for cmdline completions
    "hrsh7th/cmp-path",             -- source for file system paths
    "L3MON4D3/LuaSnip",             -- snippet engine
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "tailwind-tools",               -- tailwind
    "onsails/lspkind.nvim",         -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local compare = require("cmp.config.compare")

    -- local has_words_before = function()
    -- 	unpack = unpack or table.unpack
    -- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    -- end

    -- luasnip.filetype_extend("htmldjango", { "html" })

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
        -- ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        -- ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
        -- ["<C-s>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-c>"] = cmp.mapping.abort(),    -- close completion window
        ["<C-e>"] = cmp.mapping.confirm({ select = false }),

        -- ["<Tab>"] = cmp.mapping(function(fallback)
        -- 	if cmp.visible() then
        -- 		cmp.select_next_item()
        -- 	-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- 	-- they way you will only jump inside the snippet region
        -- 	elseif luasnip.expand_or_jumpable() then
        -- 		luasnip.expand_or_jump()
        -- 	elseif has_words_before() then
        -- 		cmp.complete()
        -- 	else
        -- 		fallback()
        -- 	end
        -- end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        -- intellij-like mapping
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        -- 	-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        -- 	if cmp.visible() then
        -- 		local entry = cmp.get_selected_entry()
        -- 		if not entry then
        -- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        -- 		else
        -- 			cmp.confirm()
        -- 		end
        -- 	else
        -- 		fallback()
        -- 	end
        -- end, { "i", "s", "c" }),

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
        { name = "luasnip" },  -- snippets
        { name = "buffer" },   -- text within current buffer
        { name = "path" },     -- file system paths
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
            strategy = 2, -- latex
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
