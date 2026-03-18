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

  -- LSP LINES removido para reducir ruido visual
  -- (El usuario solo quiere ver fallos de sintaxis/errores)
}
