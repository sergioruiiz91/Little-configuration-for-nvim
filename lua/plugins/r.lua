-- ~/.config/nvim/lua/plugins/r.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        "r",
        "rnoweb",
        "markdown",
        "markdown_inline",
        "yaml",
        "latex",
        "csv",
      })
    end,
  },

  {
    "R-nvim/R.nvim",
    lazy = false,
    config = function()
      local opts = {
        -- 'on startup' solo arrancará el motor si el archivo es un archivo de R o Rmd
        -- R.nvim por defecto no debería arrancar en .md si no tiene bloques de R
        auto_start = "on startup",
        objbr_auto_start = false,
        auto_quit = true,
        R_args = { "--quiet", "--no-save" },
        rconsole_width = 0,
        rconsole_height = 20,
        min_editor_width = 72,

        hook = {
          on_filetype = function()
            local ft = vim.bo.filetype
            -- Solo activamos mapeos si es R o Rmd
            if ft == "r" or ft == "rmd" then
              local wk = require("which-key")
              wk.add({
                { "<leader>rd", group = " R Docs", buffer = 0 },
                { "<leader>rdh", "<Plug>RHelp", desc = "Ayuda función", buffer = 0 },
                { "<leader>rds", "<Plug>RDSummary", desc = "summary(objeto)", buffer = 0 },
                { "<leader>rdn", "<Plug>RDNames", desc = "names(objeto)", buffer = 0 },
                { "<leader>rdt", "<Plug>RDStr", desc = "str(objeto)", buffer = 0 },

                { "<leader>rw", group = " R Workspace", buffer = 0 },
                { "<leader>rwo", "<Plug>ROpenObjectBrowser", desc = "Object browser", buffer = 0 },
                { "<leader>rwl", "<Plug>RListSpace", desc = "ls() workspace", buffer = 0 },
                { "<leader>rwv", "<Plug>RViewDF", desc = "Ver dataframe", buffer = 0 },

                { "<leader>rg", "<Plug>RPlot", desc = "Plot objeto", buffer = 0 },
                
                -- Ejecución de Chunks en Rmd
                { "<leader>rc", "<Plug>RSendChunk", desc = "󱄄 ejecutar chunk (Rmd)", buffer = 0 },
              })
              
              vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", { silent = true })
              vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", { silent = true })
            end
          end,
        },

        objbr_mappings = {
          c = "class",
          s = "summary",
          v = function()
            require("r.browser").toggle_view()
          end,
        },

        disable_cmds = {
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      }

      require("r").setup(opts)
    end,
  },
}
