return {
  {
    "github/copilot.vim",
    event = "InsertEnter", -- lazy-load, no eager
    cmd = "Copilot", -- también carga si llamas a :Copilot ...
    init = function()
      -- 1) No usar <Tab> por defecto
      vim.g.copilot_no_tab_map = true

      -- (Opcional) Si quieres habilitar/inhabilitar filetypes:
      -- vim.g.copilot_filetypes = { ["*"] = true }
    end,
    config = function()
      -- Keymaps "acciones rápidas" en INSERT (aceptar/dismiss/next/prev)
      -- Puedes usarlas aunque luego también tengas los de <leader>ñ en normal.
      --
      -- Aceptar sugerencia (con fallback vacío: si no hay sugerencia, no hace nada)
      vim.keymap.set("i", "<M-l>", 'copilot#Accept("")', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot: Accept",
      })

      -- Dismiss (rechazar sugerencia)
      vim.keymap.set("i", "<M-h>", "<Plug>(copilot-dismiss)", { desc = "Copilot: Dismiss" })

      -- Siguiente / anterior sugerencia
      vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Copilot: Next suggestion" })
      vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { desc = "Copilot: Previous suggestion" })
    end,
  },
}
