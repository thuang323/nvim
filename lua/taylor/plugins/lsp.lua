return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "Hoffs/omnisharp-extended-lsp.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap


      -- used to enable autocompletion (assign to every lsp server config)
      -- local capabilities = cmp_nvim_lsp.default_capabilities()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

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
        -- gra          code action
        -- grn          rename
        -- <C-s>        signature_help in insert mode
        keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        -- keymap.set({ "n", "v" }, "<M-F>", function()
        --     vim.lsp.buf.format({ async = true })
        -- end, opts) -- mapping to format
      end


      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure html server
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
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
      local omnisharp_handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
        ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
        ["textDocument/references"] = require("omnisharp_extended").references_handler,
        ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
      }

      lspconfig.omnisharp.setup({
        on_attach = on_attach,
        handlers = omnisharp_handlers,
        capabilities = capabilities,
        cmd = { "omnisharp" },
        root_markers = { ".sln", ".csproj", "omnisharp.json", "function.json" },
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = false,
          },
          MsBuild = {},
          RenameOptions = {},
          RoslynExtensionsOptions = {},
          Sdk = {
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
        settings = {
          Lua = {
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
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {},
  }
}
