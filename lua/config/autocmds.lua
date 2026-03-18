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

-- Ajuste de línea suave (Soft Wrap) para Markdown y R Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "rmd", "quarto" }, -- Incluyo quarto por si acaso lo usas con R
  group = vim.api.nvim_create_augroup("soft_wrap_markdown", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true -- Activar el ajuste visual
    vim.opt_local.linebreak = true -- No romper palabras a la mitad
    vim.opt_local.breakindent = true -- Mantener el indentado al saltar de línea visual

    -- Remapear j y k para moverse por líneas visuales en lugar de líneas reales del archivo
    local opts = { buffer = true, silent = true }
    vim.keymap.set("n", "j", "gj", opts)
    vim.keymap.set("n", "k", "gk", opts)
    vim.keymap.set("v", "j", "gj", opts)
    vim.keymap.set("v", "k", "gk", opts)
  end,
})
