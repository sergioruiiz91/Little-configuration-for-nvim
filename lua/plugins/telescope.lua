-- 🔍 CONFIGURACIÓN DE TELESCOPE.NVIM
-- El motor de búsqueda principal de Neovim. Permite buscar archivos, palabras y buffers.

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,

  dependencies = {
    {
      -- Extensión FZF en C para una búsqueda ultra rápida y difusa (fuzzy search)
      "nvim-telescope/telescope-fzf-native.nvim",
      build = vim.fn.executable("cmake") == 1
          and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        or "make",
      enabled = vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1,
    },
  },

  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "horizontal", -- Layout moderno horizontal
        layout_config = {
          horizontal = {
            prompt_position = "top", -- Caja de búsqueda arriba
            preview_width = 0.55,    -- 55% de pantalla para la previsualización
          },
          width = 0.87,
          height = 0.80,
        },
        sorting_strategy = "ascending", -- Resultados de mejor a peor hacia arriba
        
        mappings = {
          i = {
            -- MODIFICACIÓN SOLICITADA: ESC te pasa a MODO NORMAL en lugar de cerrar
            ["<esc>"] = function(bufnr)
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            end,
            ["<C-Down>"] = actions.cycle_history_next, -- Historial de búsquedas hacia abajo
            ["<C-Up>"] = actions.cycle_history_prev,    -- Historial de búsquedas hacia arriba
            ["<C-f>"] = actions.preview_scrolling_down, -- Desplazar previsualización abajo
            ["<C-b>"] = actions.preview_scrolling_up,   -- Desplazar previsualización arriba
          },
          n = {
            ["q"] = actions.close,     -- Cerrar con 'q' en modo normal
            ["<esc>"] = actions.close, -- Cerrar con 'ESC' si ya estás en modo normal
          },
        },
      },
    }
  end,

  -- ATAJOS GLOBALES <leader>f (Find) y <leader>s (Search)
  keys = {
    { "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "󰈔 cambiar buffer" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "󰍉 buscar texto (grep)" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "󰈔 buscar archivo (root)" },
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "󰃖 historial comandos" },
    
    -- Familia FIND (leader f)
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "󰈔 buffers abiertos" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "󰈔 buscar archivos" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "󰈔 archivos recientes" },
    
    -- Familia SEARCH (leader s)
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "󰍉 grep en todo el proyecto" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "󰍉 buscar palabra bajo el cursor" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "󰞋 páginas de ayuda" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "󰌌 mapa de teclas global" },
  },
}

