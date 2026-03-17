-- lua/plugins/runner.lua
--
-- 🚀 RUNNER — ejecutar código desde Neovim estilo VSCode
-- ─────────────────────────────────────────────────────
-- Todos los atajos viven bajo <leader>r (de "run")
--
-- ➕ PARA AÑADIR MÁS LENGUAJES EN EL FUTURO:
--    1. Copia el bloque de tu lenguaje al final de keys = { ... }
--    2. Cambia el cmd por el ejecutable correspondiente:
--         R          →  cmd = "Rscript " .. file
--         Node.js    →  cmd = "node " .. file
--         Lua        →  cmd = "lua " .. file
--         Ruby       →  cmd = "ruby " .. file
--         Go         →  cmd = "go run " .. file
--         Bash       →  cmd = "bash " .. file
--         Julia      →  cmd = "julia " .. file
--    3. Para REPLs interactivos (equivalente a ipython):
--         R          →  cmd = "R"
--         Node.js    →  cmd = "node"
--         Julia      →  cmd = "julia"
--         Lua        →  cmd = "lua"

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",

    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_insert = true,
      persist_size = true,
      direction = "horizontal", -- panel abajo por defecto como VSCode
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 3,
      },
    },

    keys = function()
      -- ─────────────────────────────────────────────
      --  UTILIDAD: detecta el python correcto
      --  busca venv en este orden:
      --    1. .venv/bin/python  ← lo más común
      --    2. venv/bin/python
      --    3. env/bin/python
      --    4. python3 del sistema (fallback)
      -- ─────────────────────────────────────────────
      local function find_python()
        local root = vim.fn.getcwd()

        local candidates = {
          root .. "/.venv/bin/python",
          root .. "/venv/bin/python",
          root .. "/env/bin/python",
          -- ➕ añade más rutas si tu venv tiene otro nombre:
          -- root .. "/mi_entorno/bin/python",
        }

        for _, path in ipairs(candidates) do
          if vim.fn.executable(path) == 1 then
            vim.notify("🐍 venv detectado: " .. path, vim.log.levels.INFO)
            return path
          end
        end

        vim.notify("⚠️  Sin venv, usando python3 del sistema", vim.log.levels.WARN)
        return "python3"
      end

      return {

        -- ─────────────────────────────────────────────
        --  <leader>rt  →  TERMINALES
        -- ─────────────────────────────────────────────
        { "<leader>rtt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (bottom)" },
        { "<leader>rtf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal (float)" },
        { "<leader>rtv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal (side)" },
        -- salir del modo insert dentro de la terminal
        { "<Esc>", [[<C-\><C-n>]], desc = "Exit terminal mode", mode = "t" },

        -- ─────────────────────────────────────────────
        --  <leader>rr  →  RUN (archivo completo)
        --  detecta filetype Y venv automáticamente
        -- ─────────────────────────────────────────────
        {
          "<leader>rr",
          function()
            local file = vim.fn.expand("%:p")
            local ft = vim.bo.filetype

            -- mapa filetype → comando
            -- ➕ añade aquí tu lenguaje: ["filetype"] = "ejecutable "
            local runners = {
              python = find_python() .. " ",
              -- r       = "Rscript ",          -- descomenta para R
              -- lua     = "lua ",              -- descomenta para Lua
              -- ruby    = "ruby ",             -- descomenta para Ruby
              -- sh      = "bash ",             -- descomenta para Bash
              -- javascript = "node ",          -- descomenta para Node.js
              -- go      = "go run ",           -- descomenta para Go
              -- julia   = "julia ",            -- descomenta para Julia
            }

            local cmd = runners[ft]
            if not cmd then
              vim.notify("❌ No runner configurado para: " .. ft, vim.log.levels.WARN)
              return
            end

            require("toggleterm.terminal").Terminal
              :new({
                cmd = cmd .. file,
                direction = "horizontal",
                close_on_exit = false, -- no cierra para ver el output
                on_open = function()
                  vim.cmd("startinsert!")
                end,
              })
              :toggle()
          end,
          desc = "Run File (auto filetype + venv)",
        },

        -- ─────────────────────────────────────────────
        --  <leader>rl  →  RUN LINE (línea actual)
        -- ─────────────────────────────────────────────
        {
          "<leader>rl",
          function()
            local line = vim.api.nvim_get_current_line()
            require("toggleterm").exec(line)
          end,
          desc = "Run Current Line",
        },

        -- ─────────────────────────────────────────────
        --  <leader>rs  →  RUN SELECTION (selección visual)
        -- ─────────────────────────────────────────────
        {
          "<leader>rs",
          function()
            local start_pos = vim.fn.getpos("'<")
            local end_pos = vim.fn.getpos("'>")
            local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
            local selection = table.concat(lines, "\n")
            local python = find_python()
            require("toggleterm").exec(python .. " -c '" .. selection .. "'")
            -- ➕ para otros lenguajes:
            --    R       →  require("toggleterm").exec(selection)  (dentro de R REPL)
            --    Node.js →  require("toggleterm").exec("node -e '" .. selection .. "'")
            --    Ruby    →  require("toggleterm").exec("ruby -e '" .. selection .. "'")
          end,
          desc = "Run Selection",
          mode = "x",
        },

        -- ─────────────────────────────────────────────
        --  <leader>ri  →  REPLs interactivos
        -- ─────────────────────────────────────────────

        -- IPython (usa el del venv si existe)
        {
          "<leader>rip",
          function()
            local python = find_python()
            require("toggleterm.terminal").Terminal
              :new({
                cmd = python .. " -m IPython", -- usa el ipython del venv
                direction = "vertical",
                on_open = function()
                  vim.cmd("startinsert!")
                end,
              })
              :toggle()
          end,
          desc = "REPL: IPython",
        },

        -- ➕ EJEMPLO R (descomenta cuando añadas R):
        -- {
        --   "<leader>rir",
        --   function()
        --     require("toggleterm.terminal").Terminal
        --       :new({ cmd = "R", direction = "vertical" })
        --       :toggle()
        --   end,
        --   desc = "REPL: R",
        -- },

        -- ➕ EJEMPLO Node.js (descomenta cuando añadas JS):
        -- {
        --   "<leader>rin",
        --   function()
        --     require("toggleterm.terminal").Terminal
        --       :new({ cmd = "node", direction = "vertical" })
        --       :toggle()
        --   end,
        --   desc = "REPL: Node.js",
        -- },

        -- ─────────────────────────────────────────────
        --  F5  →  shortcut rápido = igual que <leader>rr
        -- ─────────────────────────────────────────────
        {
          "<F5>",
          function()
            local file = vim.fn.expand("%:p")
            local ft = vim.bo.filetype
            local runners = {
              python = find_python() .. " ",
              -- ➕ mismo mapa que arriba
            }
            local cmd = runners[ft]
            if not cmd then
              vim.notify("❌ No runner configurado para: " .. ft, vim.log.levels.WARN)
              return
            end
            require("toggleterm.terminal").Terminal
              :new({
                cmd = cmd .. file,
                direction = "horizontal",
                close_on_exit = false,
                on_open = function()
                  vim.cmd("startinsert!")
                end,
              })
              :toggle()
          end,
          desc = "Run File (F5)",
        },
      }
    end,
  },
}
