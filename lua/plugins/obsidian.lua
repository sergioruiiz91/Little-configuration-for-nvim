return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  enabled = function()
    if vim.g.disable_obsidian then
      return false
    end

    -- Busca .obsidian subiendo desde el directorio actual
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
      -- También comprueba el home por defecto
      if vim.fn.isdirectory(os.getenv("HOME") .. "/.config/obsidian/.obsidian") == 1 then
        return os.getenv("HOME") .. "/.config/obsidian"
      end
      return nil
    end

    return find_obsidian_vault() ~= nil
  end,

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = function()
    -- Detecta el vault dinámicamente
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
      if vim.fn.isdirectory(os.getenv("HOME") .. "/.config/obsidian/.obsidian") == 1 then
        return os.getenv("HOME") .. "/.config/obsidian"
      end
      return nil
    end

    local vault_path = find_obsidian_vault()
    local vault_name = vault_path and vim.fn.fnamemodify(vault_path, ":t") or "notes"

    return {
      legacy_commands = false,

      workspaces = {
        {
          name = vault_name, -- toma el nombre de la carpeta detectada
          path = vault_path or (os.getenv("HOME") .. "/.config/obsidian"),
        },
      },

      note_id_func = function(title)
        if title ~= nil then
          return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          return tostring(os.time())
        end
      end,

      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        template = "daily.md",
      },

      completion = {
        cmp = true,
        min_chars = 2,
      },

      picker = {
        name = "snacks.pick",
      },

      ui = {
        enable = true,
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        },
      },

      callbacks = {
        enter_note = function(note)
          if not note then
            return
          end
          vim.keymap.set("n", "gf", function()
            return require("obsidian").util.gf_passthrough()
          end, { buffer = note.bufnr, expr = true, desc = "Obsidian follow link" })
          vim.keymap.set("n", "<leader>ch", function()
            return require("obsidian").util.toggle_checkbox()
          end, { buffer = note.bufnr, desc = "Toggle checkbox" })
          vim.keymap.set("n", "<cr>", function()
            return require("obsidian").util.smart_action()
          end, { buffer = note.bufnr, expr = true, desc = "Obsidian smart action" })
          vim.keymap.set("n", "<Space>ob", "<Cmd>ObsidianBacklinks<CR>", { buffer = note.bufnr, desc = "Backlinks" })
          vim.keymap.set("n", "<Space>ot", "<Cmd>ObsidianTags<CR>", { buffer = note.bufnr, desc = "Buscar por tags" })
        end,
      },

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
        tags = "",
      },
    }
  end,
}
