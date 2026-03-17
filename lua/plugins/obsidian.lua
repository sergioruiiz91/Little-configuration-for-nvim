-- 󱓧 CONFIGURACIÓN DE OBSIDIAN.NVIM
-- Este archivo integra Neovim con tu bóveda (vault) de notas de Obsidian.
-- Incluye atajos mnemotécnicos bajo <leader>n (Notas) y lógica de detección dinámica.

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- usa la última versión estable
  lazy = true,
  -- Carga el plugin solo al abrir archivos Markdown o entrar en la carpeta de Obsidian
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "saghen/blink.cmp", -- Motor de autocompletado moderno
  },

  opts = function()
    -- FUNCIÓN: Detectar automáticamente la carpeta .obsidian subiendo directorios
    local function find_obsidian_vault()
      local path = vim.fn.getcwd()
      local prev = nil
      while path ~= prev do
        if vim.fn.isdirectory(path .. "/.obsidian") == 1 then
          return path
        end
        prev = path
        path = vim.fn.fnamemodify(path, ":h")
      end
      -- Fallback al directorio por defecto si no se detecta nada
      local home_vault = os.getenv("HOME") .. "/.config/obsidian"
      if vim.fn.isdirectory(home_vault .. "/.obsidian") == 1 then
        return home_vault
      end
      return nil
    end

    local vault_path = find_obsidian_vault()
    local vault_name = vault_path and vim.fn.fnamemodify(vault_path, ":t") or "vault"

    return {
      workspaces = {
        {
          name = vault_name,
          path = vault_path or (os.getenv("HOME") .. "/.config/obsidian"),
        },
      },

      -- Organización de las notas en carpetas
      notes_subdir = "notes",
      log_level = vim.log.levels.INFO,

      -- Configuración de las notas diarias (Daily Notes)
      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        template = "daily.md",
      },

      -- Integración con el buscador de Snacks (Telescope alternativo)
      picker = {
        name = "snacks.pick",
      },

      -- Lógica para generar IDs de notas (minúsculas y guiones)
      note_id_func = function(title)
        if title ~= nil then
          return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          return tostring(os.time())
        end
      end,

      -- Integración con Blink para sugerencias de enlaces [[nota]]
      completion = {
        nvim_cmp = false, 
        blink = true,    
        min_chars = 2,
      },

      -- Estética de los checkboxes para tareas [ ]
      ui = {
        enable = true,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "󰄲", hl_group = "ObsidianDone" },
          [">"] = { char = "󰭹", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        },
      },
    }
  end,

  -- ATAJOS GLOBALES <leader>n (Notas)
  keys = {
    { "<leader>n", group = "󱓧 obsidian" },
    { "<leader>no", "<cmd>ObsidianQuickSwitch<cr>", desc = "󰍉 abrir nota (open)" },
    { "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "󰐕 nueva nota (new)" },
    { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "󱎸 buscar en notas (search)" },
    { "<leader>nd", "<cmd>ObsidianToday<cr>", desc = "󰃭 nota de hoy (daily)" },
    { "<leader>nt", "<cmd>ObsidianTags<cr>", desc = "󰓹 buscar etiquetas (tags)" },
    { "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "󰌹 ver backlinks", mode = "n" },
    { "<leader>nc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "󰄲 check/uncheck" },
    { "<leader>ni", "<cmd>ObsidianTemplate<cr>", desc = "󰏪 insertar plantilla" },
    -- Navegación rápida nativa de Obsidian
    { "gf", function() return require("obsidian").util.gf_passthrough() end, desc = "Obsidian: Seguir Link", ft = "markdown", expr = true },
  },
}

