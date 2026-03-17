return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  ft = { "markdown", "rmd", "quarto" },
  opts = {
    -- Estilo moderno tipo Obsidian
    heading = {
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      },
    },
    code = {
      sign = true,
      width = "block",
      right_pad = 4,
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 " },
      checked = { icon = "󰄲 " },
    },
    callout = {
      -- Soporte para callouts de Obsidian [!INFO], [!WARNING], etc.
      note = { icon = "󰎟", title = "Note" },
      tip = { icon = "󰌵", title = "Tip" },
      important = { icon = "󰅒", title = "Important" },
      warning = { icon = "󰀪", title = "Warning" },
      caution = { icon = "󰳦", title = "Caution" },
    },
  },
}
