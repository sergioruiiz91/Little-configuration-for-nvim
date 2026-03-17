-- lua/plugins/lang.lua
return {
  {
    "nvim-lspconfig",
    opts = {
      -- diagnósticos estilo VSCode
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      },
      servers = {
        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
        -- R
        r_language_server = {
          settings = {
            r = {
              lsp = { diagnostics = true },
            },
          },
        },
        -- keymaps para todos los LSP
        ["*"] = {
          keys = {
            {
              "gd",
              function()
                require("telescope.builtin").lsp_definitions({ reuse_win = true })
              end,
              desc = "Goto Definition",
            },
            {
              "gr",
              function()
                require("telescope.builtin").lsp_references({
                  include_declaration = true, -- ← incluye la propia definición
                  show_line = true,
                })
              end,
              desc = "References",
              nowait = true,
            },
            {
              "K",
              vim.lsp.buf.hover,
              desc = "Hover Docs",
            },
          },
        },
      },
    },
  },
}
