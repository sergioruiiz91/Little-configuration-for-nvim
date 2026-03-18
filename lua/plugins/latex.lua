return {
  "Thiago4532/mdmath.nvim",
  lazy = true,
  event = "VeryLazy",
  build = "MdMath build",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    filetypes = { "markdown", "rmd", "quarto" },
    -- Blanco sobre fondo oscuro (el fondo blanco no está soportado por el plugin)
    foreground = "#ffffff", 
    background = "#161616", 
    anticonceal = true,
    hide_on_insert = true,
    dynamic = true,
    dynamic_scale = 1.0,
    update_interval = 400,
    internal_scale = 1.0,
  },
  config = function(_, opts)
    -- Lo cargamos de forma segura
    local ok, mdmath = pcall(require, "mdmath")
    if ok then
      mdmath.setup(opts)
    end
  end,
  keys = {
    { "<leader>ml", "<cmd>MdMath build<CR>", desc = "MdMath: build" },
    { "<leader>ms", "<cmd>MdMath toggle<CR>", desc = "MdMath: toggle" },
    { "<leader>me", "<cmd>MdMath enable<CR>", desc = "MdMath: enable" },
  },
}
