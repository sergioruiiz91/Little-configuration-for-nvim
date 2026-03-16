-- ~/.config/nvim/lua/plugins/theme.lua
return {
  {
    "shaunsingh/moonlight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Opciones van como variables globales, NO como setup()
      vim.g.moonlight_italic_comments = true
      vim.g.moonlight_italic_keywords = true
      vim.g.moonlight_italic_functions = true
      vim.g.moonlight_contrast = true
      vim.g.moonlight_borders = false

      require("moonlight").set()
    end,
  },
}
