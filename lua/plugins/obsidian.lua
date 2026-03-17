return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- usa la última estable
  lazy = true,
  -- carga el plugin solo si entras en una carpeta de Obsidian o abres un md
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "saghen/blink.cmp", -- Integración con tu autocompletado
  },

  opts = function()
    -- FUNCIÓN: Detectar el vault dinámicamente (subiendo carpetas)
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
      -- Fallback al home de obsidian si existe
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

      -- Configuración de notas
      notes_subdir = "notes",
      log_level = vim.log.levels.INFO,

      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        template = "daily.md",
      },

      -- Integración con tu Picker (snacks.pick)
      picker = {
        name = "snacks.pick",
      },

      -- Formato de ID de nota (minúsculas y guiones)
      note_id_func = function(title)
        if title ~= nil then
          return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          return tostring(os.time())
        end
      end,

      -- Completado estilo Obsidian
      completion = {
        nvim_cmp = false, -- desactiva cmp viejo
        blink = true,    -- ACTIVA BLINK (tu motor actual)
        min_chars = 2,
      },

      -- UI y símbolos
      ui = {
        enable = true,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "󰄲", hl_group = "ObsidianDone" },
          [">"] = { char = "󰭹", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        },
      },

      -- Atajos automáticos al entrar en una nota
      callbacks = {
        enter_note = function(note)
          if not note then return end
          local b = note.bufnr
          vim.keymap.set("n", "gf", function() return require("obsidian").util.gf_passthrough() end, { buffer = b, expr = true, desc = "Obsidian: Follow Link" })
          vim.keymap.set("n", "<leader>ch", function() return require("obsidian").util.toggle_checkbox() end, { buffer = b, desc = "Obsidian: Toggle Checkbox" })
          vim.keymap.set("n", "<cr>", function() return require("obsidian").util.smart_action() end, { buffer = b, expr = true, desc = "Obsidian: Smart Action" })
          vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { buffer = b, desc = "Obsidian: Backlinks" })
        end,
      },
    }
  end,
}
