return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme("oxocarbon")

      -- Función para aplicar transparencia y colores personalizados
      local function apply_transparency()
        local highlights = {
          "Normal",
          "NormalFloat",
          "NormalNC",
          "SignColumn",
          "FoldColumn",
          "EndOfBuffer",
          "TelescopeNormal",
          "TelescopeBorder",
          "NoiceFormatConfirm",
          "NoiceFormatConfirmBorder",
        }
        for _, group in ipairs(highlights) do
          vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
        
        -- Texto seleccionado en morado chillón
        vim.api.nvim_set_hl(0, "Visual", { bg = "#9d00ff", fg = "#ffffff", bold = true })
      end

      apply_transparency()

      -- Re-aplicar transparencia si se cambia el tema manualmente
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = apply_transparency,
      })
    end,
  },
}
