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
        auto_start = "always",
        auto_quit = true,
        R_args = { "--quiet", "--no-save" },
        min_editor_width = 72,
        rconsole_width = 78,

        hook = {
          on_filetype = function()
            local wk = require("which-key")
            wk.add({

              { "<Space>r", group = "R", buffer = 0 },

              -- Sesión
              { "<Space>rf", "<Plug>RStart", desc = "INICIAR R", buffer = 0 },
              { "<Space>rq", "<Plug>RClose", desc = "APAGAR R", buffer = 0 },

              -- Enviar código
              { "<Space>rd", "<Plug>RDSendLine", desc = "Enviar línea", buffer = 0 },
              { "<Space>rp", "<Plug>RSendParagraph", desc = "Enviar párrafo", buffer = 0 },
              { "<Space>ra", "<Plug>RSendFile", desc = "Enviar archivo", buffer = 0 },
              { "<Space>rb", "<Plug>RSendMBlock", desc = "Enviar bloque", buffer = 0 },
              { "<Space>rc", "<Plug>RSendChunk", desc = "Enviar chunk", buffer = 0 }, -- solo Rmd/qmd

              -- Documentación
              { "<Space>rh", "<Plug>RHelp", desc = "Ayuda función", buffer = 0 },
              { "<Space>ri", "<Plug>RDSummary", desc = "summary(objeto)", buffer = 0 },
              { "<Space>rn", "<Plug>RDNames", desc = "names(objeto)", buffer = 0 },
              { "<Space>rt", "<Plug>RDStr", desc = "str(objeto)", buffer = 0 },

              -- Workspace
              { "<Space>ro", "<Plug>ROpenObjectBrowser", desc = "Object browser", buffer = 0 },
              { "<Space>rl", "<Plug>RListSpace", desc = "ls() workspace", buffer = 0 },
              { "<Space>rv", "<Plug>RViewDF", desc = "Ver dataframe", buffer = 0 },

              -- Render (Rmd / qmd)
              { "<Space>rr", "<Plug>RMakeRmd", desc = "Render Rmd/qmd", buffer = 0 },
              { "<Space>rk", "<Plug>RMakePDFK", desc = "Compilar PDF", buffer = 0 },

              -- Plots
              { "<Space>rg", "<Plug>RPlot", desc = "Plot objeto", buffer = 0 },

              -- Visual mode
              { "<Space>rs", "<Plug>RSendSelection", desc = "Enviar selección", mode = "v", buffer = 0 },
            })
            -- Enter para ejecutar sigue igual
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", { silent = true })
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", { silent = true })
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

      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = "on startup"
        opts.objbr_auto_start = true
      end

      require("r").setup(opts)
    end,
  },
}
