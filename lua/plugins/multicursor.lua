return {
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      -- Flujo VSCode:
      -- 1. Ctrl+v  → entras en visual block (nativo de nvim)
      -- 2. j/k     → expandes/contraes la selección (nativo)
      -- 3. h/l     → mueves la selección (nativo)
      -- 4. Shift+I → cursores al principio de cada línea seleccionada
      -- 5. Shift+A → cursores al final de cada línea seleccionada

      -- Añadir cursores arriba/abajo (alternativa al visual block)
      { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Cursor abajo" },
      { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Cursor arriba" },

      -- Con flechas también (útil en insert mode)
      { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Cursor abajo" },
      { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Cursor arriba" },

      -- Ctrl+clic para añadir/quitar cursor con el ratón
      { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Cursor con ratón" },

      -- LA CLAVE: seleccionas con Ctrl+v + j/k, luego estas dos teclas
      -- añaden un cursor en cada línea de la selección
      { "I", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = { "x" }, desc = "Cursores al inicio de selección" },
      { "A", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = { "x" }, desc = "Cursores al final de selección" },

      -- Buscar palabra bajo cursor y añadir cursor en cada coincidencia
      {
        "<Space>ma",
        "<Cmd>MultipleCursorsAddMatches<CR>",
        mode = { "n", "x" },
        desc = "Cursor en cada match",
      },
      {
        "<Space>mA",
        "<Cmd>MultipleCursorsAddMatchesV<CR>",
        mode = { "n", "x" },
        desc = "Cursor en matches (todo el archivo)",
      },
    },
  },
}
