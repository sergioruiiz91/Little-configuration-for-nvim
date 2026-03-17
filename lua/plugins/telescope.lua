return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,

  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      config = function(plugin)
        LazyVim.on_load("telescope.nvim", function()
          local ok, err = pcall(require("telescope").load_extension, "fzf")

          if not ok then
            local lib = plugin.dir .. "/build/libfzf." .. (LazyVim.is_win() and "dll" or "so")

            if not vim.uv.fs_stat(lib) then
              LazyVim.warn("`telescope-fzf-native.nvim` not built. Rebuilding...")

              require("lazy").build({ plugins = { plugin }, show = false }):wait(function()
                LazyVim.info("Rebuilding `telescope-fzf-native.nvim` done.\nPlease restart Neovim.")
              end)
            else
              LazyVim.error("Failed to load `telescope-fzf-native.nvim`:\n" .. err)
            end
          end
        end)
      end,
    },
  },

  keys = {

    -- buffer navigation
    {
      "<leader>,",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer", -- Telescope: lista los buffers abiertos ordenados por uso reciente
    },

    { "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (Project dir)" }, -- Telescope: busca texto en tiempo real en todo el proyecto
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" }, -- Telescope: muestra el historial de comandos ejecutados
    { "<leader><space>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" }, -- Telescope: busca archivos desde la raíz del proyecto

    -- ======================
    -- FIND (archivos)
    -- ======================

    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers (all)" }, -- Telescope: lista todos los buffers abiertos
    { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" }, -- Telescope: busca archivos de configuración de Neovim
    { "<leader>ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" }, -- Telescope: busca archivos desde la raíz del proyecto
    { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" }, -- Telescope: busca archivos en el directorio actual

    -- ======================
    -- GIT
    -- ======================

    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" }, -- Telescope: muestra el historial de commits de Git
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" }, -- Telescope: muestra los archivos modificados/staged/sin trackear
    { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Git Stash" }, -- Telescope: lista las entradas del stash de Git

    -- ======================
    -- SEARCH
    -- ======================

    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer Lines" }, -- Telescope: busca texto dentro del archivo actual
    { "<leader>sF", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Search fault" }, -- Telescope: muestra los errores/warnings del archivo actual
    { "<leader>sP", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" }, -- Telescope: busca texto en tiempo real en todo el proyecto
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" }, -- Telescope: busca grupos de colores/highlight de Neovim
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" }, -- Telescope: muestra todos los errores/warnings del proyecto

    -- buscar palabra bajo el cursor
    { "<leader>sw", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" }, -- Telescope: busca la palabra bajo el cursor en todo el proyecto
    { "<leader>sW", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" }, -- Telescope: busca la palabra bajo el cursor en la carpeta actual

    -- buscar selección visual
    { "<leader>sw", LazyVim.pick("grep_string"), mode = "x", desc = "Selection (Root Dir)" }, -- Telescope: busca el texto seleccionado en todo el proyecto
    { "<leader>sW", LazyVim.pick("grep_string", { root = false }), mode = "x", desc = "Selection (cwd)" }, -- Telescope: busca el texto seleccionado en la carpeta actual

    -- selector de colores
    { "<leader>uC", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with Preview" }, -- Telescope: cambia el colorscheme con preview en vivo
  },
}
