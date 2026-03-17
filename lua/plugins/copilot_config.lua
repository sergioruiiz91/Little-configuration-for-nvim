return {
  -- Instalación y Configuración de Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    -- Ponemos los atajos AQUÍ para que Lazy los gestione correctamente
    keys = {
      { "<leader>ñe", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
      { "<leader>ñd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
      { "<leader>ñp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel" },
      { "<leader>ñs", "<cmd>Copilot status<cr>", desc = "Copilot Status" },
      { "<leader>ñr", "<cmd>Copilot panel refresh<cr>", desc = "Refresh Panel" },
      
      -- Atajos de sugerencia (Alt + l/h)
      { "<M-l>", function() 
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
        end
      end, desc = "Copilot Accept", mode = { "i", "n" }, silent = true },

      { "<M-h>", function() 
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").dismiss()
        end
      end, desc = "Copilot Dismiss", mode = { "i", "n" }, silent = true },
    },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = false, -- Desactivamos los por defecto para usar los nuestros
          dismiss = false,
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        layout = {
          position = "right",
          ratio = 0.4,
        },
      },
    },
  },

  -- Registrar el grupo en Which-Key
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>ñ", group = "󰚩 copilot" },
      },
    },
  },
}
