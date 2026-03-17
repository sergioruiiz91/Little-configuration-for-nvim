-- 🚀 RUNNER UNIFICADO (Python & R)
-- Este archivo unifica la ejecución de código bajo una misma lógica mnemotécnica.
-- Utiliza ToggleTerm para abrir consolas interactivas (IPython / R).

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
      start_insert = true, -- Entra en modo insertar automáticamente al abrir
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- 1. DETECCIÓN DE ENTORNOS (Virtualenvs para Python)
      -- Busca carpetas .venv o venv hacia arriba para activar el python correcto.
      local function find_python()
        local root = vim.fs.find({ ".venv", "venv", "env" }, { upward = true, type = "directory" })[1]
        if root then
          local path = root .. "/bin/python"
          if vim.fn.executable(path) == 1 then
            return path
          end
        end
        return "python3" -- Fallback al sistema
      end

      -- 2. FUNCIÓN MAESTRA DE EJECUCIÓN (Smart Run)
      -- Detecta el lenguaje (R o Python) y ejecuta la acción correspondiente.
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
            require("toggleterm").exec(vim.api.nvim_get_current_line())
          elseif action == "selection" then
            require("toggleterm").send_lines_to_terminal("visual", false, { args = vim.v.count })
          elseif action == "start" then
            require("toggleterm").exec(python .. " -m IPython")
          elseif action == "stop" then
            vim.cmd("ToggleTerm")
          end
        end
      end

      -- 3. ATAJOS MNEMOTÉCNICOS <leader>r (Runner)
      local wk = require("which-key")
      wk.add({
        { "<leader>r", group = "󰚩 runner unificado" },
        { "<leader>rr", function() smart_run("file") end, desc = "󱄄 ejecutar archivo (run)" },
        { "<leader>rl", function() smart_run("line") end, desc = "󱄄 ejecutar línea (line)" },
        { "<leader>rf", function() smart_run("start") end, desc = "󱄄 abrir consola (focus)" },
        { "<leader>rq", function() smart_run("stop") end, desc = "󱄄 cerrar consola (quit)" },
        { "<leader>rs", function() smart_run("selection") end, desc = "󱄄 ejecutar selección", mode = { "n", "x" } },
        
        -- Gestión de terminales
        { "<leader>rt", group = "󱂇 terminales" },
        { "<leader>rtt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "󱂇 terminal abajo" },
        { "<leader>rtf", "<cmd>ToggleTerm direction=float<cr>", desc = "󱂇 terminal flotante" },
        { "<leader>rtv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "󱂇 terminal lateral" },
      })
    end,
  },
}

