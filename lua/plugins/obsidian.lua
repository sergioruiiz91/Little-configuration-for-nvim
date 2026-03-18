return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    -- Grupo principal de Obsidian
    { "<leader>n", group = "󱓧 obsidian" },
    
    -- Navegación y búsqueda
    { "<leader>no", "<cmd>ObsidianQuickSwitch<cr>", desc = "󰍉 Open/Switch note" },
    { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "󱎸 Search in vault" },
    { "<leader>nf", "<cmd>ObsidianFollowLink<cr>", desc = "󰌹 Follow link" },
    { "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "󰌹 Show backlinks" },
    { "<leader>nl", "<cmd>ObsidianLinks<cr>", desc = "󰌹 List all links" },
    
    -- Crear y editar notas
    { "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "󰐕 New note" },
    { "<leader>nt", "<cmd>ObsidianTemplate<cr>", desc = "󰏪 Insert template" },
    { "<leader>nT", "<cmd>ObsidianNewFromTemplate<cr>", desc = "󰏪 New from template" },
    
    -- Notas diarias
    { "<leader>nd", group = "󰃭 daily notes" },
    { "<leader>ndd", "<cmd>ObsidianToday<cr>", desc = "󰃭 Today's note" },
    { "<leader>ndy", "<cmd>ObsidianYesterday<cr>", desc = "󰃭 Yesterday's note" },
    { "<leader>ndt", "<cmd>ObsidianTomorrow<cr>", desc = "󰃭 Tomorrow's note" },
    { "<leader>ndl", "<cmd>ObsidianDailies<cr>", desc = "󰃭 List dailies" },
    
    -- Tags y TOC
    { "<leader>ng", "<cmd>ObsidianTags<cr>", desc = "󰓹 Search tags" },
    { "<leader>nc", "<cmd>ObsidianTOC<cr>", desc = "󰎚 Table of contents" },
    
    -- Links (modo visual)
    { "<leader>nl", "<cmd>ObsidianLink<cr>", desc = "󰌹 Link selection", mode = "v" },
    { "<leader>nL", "<cmd>ObsidianLinkNew<cr>", desc = "󰌹 Link to new note", mode = "v" },
    { "<leader>ne", "<cmd>ObsidianExtractNote<cr>", desc = "󰒢 Extract to note", mode = "v" },
    
    -- Utilidades
    { "<leader>nx", "<cmd>ObsidianToggleCheckbox<cr>", desc = "󰄲 Toggle checkbox" },
    { "<leader>np", "<cmd>ObsidianPasteImg<cr>", desc = "󰥶 Paste image" },
    { "<leader>nr", "<cmd>ObsidianRename<cr>", desc = "󰑕 Rename note" },
    { "<leader>nw", "<cmd>ObsidianWorkspace<cr>", desc = "󰉋 Switch workspace" },
    { "<leader>nO", "<cmd>ObsidianOpen<cr>", desc = "󰏋 Open in Obsidian app" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = vim.fn.expand("~/.config/obsidian"),
      },
    },
    
    -- Directorio de notas
    notes_subdir = "notes",
    
    -- Nivel de log
    log_level = vim.log.levels.INFO,
    
    -- Notas diarias
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      template = nil,
    },
    
    -- Autocompletado con nvim-cmp
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    
    -- Mapeos dentro de notas markdown
    mappings = {
      -- gf para seguir links
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Enter para smart action (seguir link o toggle checkbox)
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    
    -- Dónde crear nuevas notas
    new_notes_location = "notes_subdir",
    
    -- Función para generar IDs de notas
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    
    -- Estilo de links wiki
    wiki_link_func = "use_alias_only",
    preferred_link_style = "wiki",
    
    -- Frontmatter
    disable_frontmatter = false,
    
    -- Plantillas
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
      },
    },
    
    -- Picker (telescope)
    picker = {
      name = "telescope.nvim",
      note_mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
      tag_mappings = {
        tag_note = "<C-x>",
        insert_tag = "<C-l>",
      },
    },
    
    -- Ordenamiento de búsquedas
    sort_by = "modified",
    sort_reversed = true,
    
    -- UI y estética
    ui = {
      enable = true,
      update_debounce = 200,
      max_file_length = 5000,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
    
    -- Adjuntos e imágenes
    attachments = {
      img_folder = "assets/imgs",
      img_name_func = function()
        return string.format("%s-", os.time())
      end,
    },
    
    -- Abrir URLs externas (Linux)
    follow_url_func = function(url)
      vim.fn.jobstart({ "xdg-open", url })
    end,
  },
}
