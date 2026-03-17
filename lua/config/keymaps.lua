-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
--
-- lua/config/keymaps.lua

-- =====================
-- LSP keymaps (Python + R)
-- =====================
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local buf = event.buf
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
    end

    -- Navegación
    map("gd", vim.lsp.buf.definition, "Ir a definición")
    map("gD", vim.lsp.buf.declaration, "Ir a declaración")
    map("gi", vim.lsp.buf.implementation, "Ir a implementación")
    map("gr", vim.lsp.buf.references, "Ver referencias")
    map("gt", vim.lsp.buf.type_definition, "Ir a tipo")

    -- Información
    map("K", vim.lsp.buf.hover, "Ver documentación")
    map("gK", vim.lsp.buf.signature_help, "Ver firma de función")

    -- Acciones
    map("<leader>cr", vim.lsp.buf.rename, "Renombrar símbolo")
    map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código")
    map("<leader>cf", vim.lsp.buf.format, "Formatear archivo")

    -- Diagnósticos
    map("<leader>cd", vim.diagnostic.open_float, "Ver error en detalle")
    map("[d", vim.diagnostic.goto_prev, "Error anterior")
    map("]d", vim.diagnostic.goto_next, "Error siguiente")
  end,
})
