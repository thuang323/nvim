return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "Hoffs/omnisharp-extended-lsp.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    -- enable keybinds only for when lsp server available
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentHighlightProvider then
        local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        vim.api.nvim_create_autocmd("CursorHold", {
          callback = vim.lsp.buf.document_highlight,
          buffer = bufnr,
          group = group,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          callback = vim.lsp.buf.clear_references,
          buffer = bufnr,
          group = group,
        })
      end

      -- keybind options
      local opts = { noremap = true, silent = true, nowait = true, buffer = bufnr }

      -- set keybinds

      -- <C-]>        go to definition
      -- <C-W>d       vim.diagnostic.open_float()
      -- [d           prev diagnostic
      -- ]d           next diagnostic
      -- gq           format
      if client.name == "omnisharp" then
        vim.cmd [[
        nnoremap gr <cmd>lua require('omnisharp_extended').telescope_lsp_references()<cr>
        nnoremap gt <cmd>lua require('omnisharp_extended').telescope_lsp_type_definition()<cr>
        nnoremap gi <cmd>lua require('omnisharp_extended').telescope_lsp_implementation()<cr>
        ]]
      else
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)       -- show definition, references
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)  -- show lsp implementation
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)      -- show lsp definitions
      end

      keymap.set("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", opts)
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- got to declaration
      keymap.set("n", "gh", vim.lsp.buf.hover, opts)       -- show documentation for what is under cursor
      keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
      keymap.set("i", "<M-s>", vim.lsp.buf.signature_help, opts)
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
      -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)        -- see available code actions, in visual mode will apply to selection
      -- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)                -- show diagnostics for line
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      keymap.set({ "n", "v" }, "<M-F>", function()
        vim.lsp.buf.format({ async = true })
      end, opts) -- mapping to format
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      -- filetypes = { "html", "htmldjango" },
    })


    -- configure vue_ls server
    lspconfig.volar.setup({
      -- NOTE: Uncomment to enable volar in file types other than vue.

      -- filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },

      -- NOTE: Uncomment to restrict Volar to only Vue/Nuxt projects. This will enable Volar to work alongside other language servers (tsserver).

      -- root_dir = require("lspconfig").util.root_pattern(
      --   "vue.config.js",
      --   "vue.config.ts",
      --   "nuxt.config.js",
      --   "nuxt.config.ts"
      -- ),
      init_options = {
        vue = {
          hybridMode = true,
        },
      },
      capabilities = capabilities,
      settings = {
        typescript = {
          inlayHints = {
            enumMemberValues = {
              enabled = true,
            },
            functionLikeReturnTypes = {
              enabled = true,
            },
            propertyDeclarationTypes = {
              enabled = true,
            },
            parameterTypes = {
              enabled = true,
              suppressWhenArgumentMatchesName = true,
            },
            variableTypes = {
              enabled = true,
            },
          },
        },
      },
    })


    -- configure ts_ls server
    -- local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
    -- local vue_language_server = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
    local vue_typescript_plugin_path = "/usr/local/lib/node_modules/@vue/typescript-plugin"

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            -- location = vue_language_server,
            location = vue_typescript_plugin_path,
            languages = { "vue" },
          }
        }
      },
      -- NOTE: To enable hybridMode, change HybrideMode to true above and uncomment the following filetypes block.
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      settings = {
        typescript = {
          tsserver = {
            useSyntaxServer = false,
          },
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
      on_attach = on_attach,
    })


    -- configure css server
    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })


    -- configure tailwindcss server
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })


    -- configure emmet_ls server
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })


    -- configure C/C++ server
    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })


    -- configure Java server
    lspconfig.jdtls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        java = {
          signatureHelp = {
            enabled = true
          },
        }
      }
    })


    -- configure OmniSharp server
    lspconfig.omnisharp.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "omnisharp" },

      settings = {
        FormattingOptions = {
          -- Enables support for reading code style, naming convention and analyzer
          -- settings from .editorconfig.
          EnableEditorConfigSupport = true,
          -- Specifies whether 'using' directives should be grouped and sorted during
          -- document formatting.
          OrganizeImports = nil,
        },
        MsBuild = {
          -- If true, MSBuild project system will only load projects for files that
          -- were opened in the editor. This setting is useful for big C# codebases
          -- and allows for faster initialization of code navigation features only
          -- for projects that are relevant to code that is being edited. With this
          -- setting enabled OmniSharp may load fewer projects and may thus display
          -- incomplete reference lists for symbols.
          LoadProjectsOnDemand = nil,
        },
        RoslynExtensionsOptions = {
          -- Enables support for roslyn analyzers, code fixes and rulesets.
          EnableAnalyzersSupport = nil,
          -- Enables support for showing unimported types and unimported extension
          -- methods in completion lists. When committed, the appropriate using
          -- directive will be added at the top of the current file. This option can
          -- have a negative impact on initial completion responsiveness,
          -- particularly for the first few completion sessions after opening a
          -- solution.
          EnableImportCompletion = nil,
          -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
          -- true
          AnalyzeOpenDocumentsOnly = nil,
        },
        Sdk = {
          -- Specifies whether to include preview versions of the .NET SDK when
          -- determining which version to use for project loading.
          IncludePrereleases = true,
        },
      },
    })


    -- configure python server
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
            autoImportCompletions = false,
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
          },
        },
      },
    })


    -- configure docker_compose server
    lspconfig.docker_compose_language_service.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })


    -- configure LaTeX server
    lspconfig.texlab.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })


    -- configure lua server (with special settings)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          format = {
            enable = true,
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
              quote_style = "double",
            },
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
