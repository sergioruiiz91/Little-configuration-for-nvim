-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Mapeos globales para terminal: ESC para modo normal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom_terminal_keymaps", { clear = true }),
  callback = function()
    local opts = { buffer = 0 }
    -- ESC para modo normal en terminal (muy útil para navegar el log)
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    -- Opcional: jk también funciona para salir
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  end,
})
