-- Keymaps are automatically loaded on the VeryLazy event
---- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
--
-- lua/config/keymaps.lua

-- =====================
-- LSP keymaps (Python + R)
-- =====================
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(event)
--     local buf = event.buf
--     local map = function(keys, func, desc)
--       vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
--     end
--
--     -- Navegación
--     map("gd", vim.lsp.buf.definition, "Ir a definición")
--     map("gD", vim.lsp.buf.declaration, "Ir a declaración")
--     map("gi", vim.lsp.buf.implementation, "Ir a implementación")
--     map("gr", vim.lsp.buf.references, "Ver referencias")
--     map("gt", vim.lsp.buf.type_definition, "Ir a tipo")
--
--     -- Información
--     map("K", vim.lsp.buf.hover, "Ver documentación")
--     map("gK", vim.lsp.buf.signature_help, "Ver firma de función")
--
--     -- Acciones
--     map("<leader>cr", vim.lsp.buf.rename, "Renombrar símbolo")
--     map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código")
--     map("<leader>cf", vim.lsp.buf.format, "Formatear archivo")
--
--     -- Diagnósticos
--     map("<leader>cd", vim.diagnostic.open_float, "Ver error en detalle")
--     map("[d", vim.diagnostic.goto_prev, "Error anterior")
--     map("]d", vim.diagnostic.goto_next, "Error siguiente")
--   end,
-- })
--
-- -- (añade esto AL FINAL del archivo)
--
-- vim.api.nvim_create_autocmd("VeryLazy", {
--   callback = function()
--     local ok, wk = pcall(require, "which-key")
--     if ok then
--       wk.add({
--         { "<leader>ñ", group = "Copilot" },
--
--         -- Toggle / control
--         { "<leader>ñe", "<cmd>Copilot enable<cr>", desc = "Copilot: Enable" },
--         { "<leader>ñd", "<cmd>Copilot disable<cr>", desc = "Copilot: Disable" },
--         { "<leader>ñs", "<cmd>Copilot status<cr>", desc = "Copilot: Status" },
--         { "<leader>ñS", "<cmd>Copilot setup<cr>", desc = "Copilot: Setup/Login" },
--         { "<leader>ñx", "<cmd>Copilot signout<cr>", desc = "Copilot: Sign out" },
--
--         -- Panel / Model
--         { "<leader>ñp", "<cmd>Copilot panel<cr>", desc = "Copilot: Panel" },
--         { "<leader>ñm", "<cmd>Copilot model<cr>", desc = "Copilot: Model" },
--
--         -- Acciones de sugerencia (modo insert)
--         {
--           "<leader>ñl",
--           'copilot#Accept("")',
--           desc = "Copilot: Accept",
--           mode = "i",
--           expr = true,
--           replace_keycodes = false,
--         },
--         { "<leader>ñh", "<Plug>(copilot-dismiss)", desc = "Copilot: Dismiss", mode = "i" },
--         { "<leader>ñ]", "<Plug>(copilot-next)", desc = "Copilot: Next", mode = "i" },
--         { "<leader>ñ[", "<Plug>(copilot-previous)", desc = "Copilot: Previous", mode = "i" },
--         { "<leader>ñ\\", "<Plug>(copilot-suggest)", desc = "Copilot: Suggest now", mode = "i" },
--         { "<leader>ñw", "<Plug>(copilot-accept-word)", desc = "Copilot: Accept word", mode = "i" },
--         { "<leader>ñL", "<Plug>(copilot-accept-line)", desc = "Copilot: Accept line", mode = "i" },
--       })
--     end
--   end,
-- })

-- ... (todo tu bloque LspAttach queda igual arriba)

-- Copilot which-key (cargar en VeryLazy)
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>ñ", group = "Copilot" },

        -- Toggle / control
        { "<leader>ñe", "<cmd>Copilot enable<cr>", desc = "Copilot: Enable" },
        { "<leader>ñd", "<cmd>Copilot disable<cr>", desc = "Copilot: Disable" },
        { "<leader>ñs", "<cmd>Copilot status<cr>", desc = "Copilot: Status" },
        { "<leader>ñS", "<cmd>Copilot setup<cr>", desc = "Copilot: Setup/Login" },
        { "<leader>ñx", "<cmd>Copilot signout<cr>", desc = "Copilot: Sign out" },

        -- Panel / Model
        { "<leader>ñp", "<cmd>Copilot panel<cr>", desc = "Copilot: Panel" },
        { "<leader>ñm", "<cmd>Copilot model<cr>", desc = "Copilot: Model" },

        -- Acciones de sugerencia (modo insert)
        {
          "<leader>ñl",
          'copilot#Accept("")',
          desc = "Copilot: Accept",
          mode = "i",
          expr = true,
          replace_keycodes = false,
        },
        { "<leader>ñh", "<Plug>(copilot-dismiss)", desc = "Copilot: Dismiss", mode = "i" },
        { "<leader>ñ]", "<Plug>(copilot-next)", desc = "Copilot: Next", mode = "i" },
        { "<leader>ñ[", "<Plug>(copilot-previous)", desc = "Copilot: Previous", mode = "i" },
        { "<leader>ñ\\", "<Plug>(copilot-suggest)", desc = "Copilot: Suggest now", mode = "i" },
        { "<leader>ñw", "<Plug>(copilot-accept-word)", desc = "Copilot: Accept word", mode = "i" },
        { "<leader>ñL", "<Plug>(copilot-accept-line)", desc = "Copilot: Accept line", mode = "i" },
      })
    end
  end,
})
