return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        -- En markdown/rmd usamos solo inject para no romper las ecuaciones
        -- 'injected' solo formatea los bloques de código (python, r, etc) 
        -- sin tocar el texto o las matemáticas.
        markdown = { "injected" },
        rmd = { "injected" },
      },
      formatters = {
        injected = {
          -- Permite formatear bloques de código dentro de MD sin tocar el texto base
          options = { ignore_errors = true },
        },
      },
    },
  },
}
