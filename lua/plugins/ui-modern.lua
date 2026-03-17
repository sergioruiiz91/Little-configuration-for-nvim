-- lua/plugins/ui-modern.lua
return {

  -- ═══════════════════════════════════════
  --  NOICE — UI moderna para LSP, cmdline, etc
  --  (ya viene en LazyVim, solo lo tuneamos)
  -- ═══════════════════════════════════════
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        -- signature help automático al escribir argumentos (como VSCode)
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true, -- se abre solo al escribir "("
            luasnip = true,
            throttle = 50,
          },
        },
        -- hover con K mejorado
        hover = {
          enabled = true,
          silent = true,
        },
        -- override los renders para que usen markdown bonito
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- barra de búsqueda abajo como VSCode
        command_palette = true, -- cmdline centrado como palette
        long_message_to_split = true, -- mensajes largos en split
        lsp_doc_border = true, -- borde en popups de docs ← clave VSCode look
      },
    },
  },

  -- ═══════════════════════════════════════
  --  LSP LINES — errores inline bajo el código
  --  (como VSCode muestra los squiggles + mensaje)
  -- ═══════════════════════════════════════
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_lines").setup()
      -- empieza desactivado, toggle con <leader>ul
      vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
    end,
    keys = {
      {
        "<leader>ul",
        function()
          local config = vim.diagnostic.config() or {}
          if config.virtual_lines then
            vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
          else
            vim.diagnostic.config({ virtual_lines = true, virtual_text = false })
          end
        end,
        desc = "Toggle LSP Lines",
      },
    },
  },
}
