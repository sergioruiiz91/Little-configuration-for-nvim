-- 󰇥 CONFIGURACIÓN DE YAZI.NVIM
-- Integra el explorador de archivos Yazi (escrito en Rust) como ventana flotante central.
-- Permite previsualizar imágenes, PDFs y código de forma ultra rápida.

return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- Abrir Yazi en el archivo/directorio actual
    {
      "<leader>y",
      function()
        require("yazi").yazi()
      end,
      desc = "󰇥 abrir yazi (archivo actual)",
    },
    -- Abrir Yazi en el directorio raíz del proyecto
    {
      "<leader>Y",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "󰇥 abrir yazi (raíz proyecto)",
    },
  },
  opts = {
    -- Ajustes visuales y de funcionamiento
    open_for_directories = false, -- Evita que se abra automáticamente al entrar en carpetas
    floating_window_styling = {
      border = "rounded", -- Bordes redondeados para una estética moderna
    },
    -- Configuración para Snap en Ubuntu (mapeo de comandos auxiliares)
    yazi_command_path = "yazi", -- Comando principal
    ya_command_path = "yazi.ya", -- Utilidad de línea de comandos (Snap utiliza yazi.ya)
  },
}

