-- lua/plugins/lang_python_r.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- Solo mostrar errores en el texto virtual (el de la derecha del código)
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "", -- Restauramos iconos mínimos para saber que el LSP está vivo
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      },

      servers = {
        -- Markdown / Rmd
        marksman = {},

        -- LaTeX
        texlab = {},

        -- R (Aseguramos que esté activo)
        r_language_server = {},

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
      },
    },
  },
}
