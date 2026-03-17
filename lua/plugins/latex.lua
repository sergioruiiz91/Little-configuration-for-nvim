return {
  "Thiago4532/mdmath.nvim",
  ft = { "markdown", "md", "rmd" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    filetypes = { "markdown", "md", "rmd" },
    foreground = "Normal",
    anticonceal = true,
    hide_on_insert = true,
    dynamic = true,
    dynamic_scale = 1.0,
    update_interval = 400,
    internal_scale = 1.0,
  },

  keys = {
    { "<leader>ml", "<cmd>MdMath build<CR>", desc = "MdMath: build" },
  },
}
