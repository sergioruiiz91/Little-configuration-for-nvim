-- lua/plugins/runner.lua
-- 🚀 RUNNER UNIFICADO PRO (Python & R)
-- ─────────────────────────────────────────────────────

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 15,
      direction = "horizontal",
      open_mapping = [[<c-\>]], 
      hide_numbers = true,
      shade_terminals = true,
      start_insert = true, -- Empieza en modo insertar
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- ─────────────────────────────────────────────────
      -- 1. DETECCIÓN DE ENTORNOS (VENV) - MEJORADA
      -- ─────────────────────────────────────────────────
      local function find_python()
        -- Busca en el directorio actual y sube hasta encontrar un venv
        local root = vim.fs.find({ ".venv", "venv", "env" }, { upward = true, type = "directory" })[1]
        
        if root then
          local path = root .. "/bin/python"
          if vim.fn.executable(path) == 1 then
            -- vim.notify("🐍 Entorno detectado: " .. path, vim.log.levels.INFO)
            return path
          end
        end
        
        -- Fallback al sistema
        return "python3"
      end

      -- ─────────────────────────────────────────────────
      -- 2. FUNCIÓN MAESTRA DE EJECUCIÓN
      -- ─────────────────────────────────────────────────
      local function smart_run(action)
        local ft = vim.bo.filetype
        
        -- CASO R
        if ft == "r" or ft == "rmd" or ft == "quarto" then
          local r_plugs = {
            file = "<Plug>RSendFile",
            line = "<Plug>RDSendLine",
            selection = "<Plug>RSendSelection",
            start = "<Plug>RStart",
            stop = "<Plug>RClose",
          }
          local cmd = r_plugs[action]
          if cmd then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, false, true), "m", false)
          end

        -- CASO PYTHON
        elseif ft == "python" then
          local python = find_python()
          if action == "file" then
            require("toggleterm").exec(python .. " " .. vim.fn.expand("%:p"))
          elseif action == "line" then
            -- Envía la línea actual al terminal abierto
            require("toggleterm").exec(vim.api.nvim_get_current_line())
          elseif action == "selection" then
            -- Envía la selección visual al terminal
            require("toggleterm").send_lines_to_terminal("visual", false, { args = vim.v.count })
          elseif action == "start" then
            require("toggleterm").exec(python .. " -m IPython")
          elseif action == "stop" then
            vim.cmd("ToggleTerm")
          end
        else
          vim.notify("Runner no configurado para: " .. ft, vim.log.levels.WARN)
        end
      end

      -- ─────────────────────────────────────────────────
      -- 3. MODO NORMAL EN TERMINAL (Esc para salir de insert)
      -- ─────────────────────────────────────────────────
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- Esc para modo normal en terminal
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)    -- jk también funciona
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- Aplicar mapeos solo cuando se abre una terminal de toggleterm
      vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

      -- ─────────────────────────────────────────────────
      -- 4. ATAJOS UNIFICADOS (Which-Key)
      -- ─────────────────────────────────────────────────
      local wk = require("which-key")
      wk.add({
        { "<leader>r", group = "󰚩 runner unificado" },
        { "<leader>rr", function() smart_run("file") end, desc = "Run File" },
        { "<leader>rl", function() smart_run("line") end, desc = "Run Line" },
        { "<leader>rf", function() smart_run("start") end, desc = "Start Session/REPL" },
        { "<leader>rq", function() smart_run("stop") end, desc = "Stop Session" },
        { "<leader>rs", function() smart_run("selection") end, desc = "Run Selection", mode = { "n", "x" } },
        
        { "<leader>rt", group = "󱂇 terminales" },
        { "<leader>rtt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal Abajo" },
        { "<leader>rtf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Flotante" },
        { "<leader>rtv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal Lateral" },
      })
    end,
  },
}
