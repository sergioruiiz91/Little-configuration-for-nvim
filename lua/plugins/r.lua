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
        -- Force horizontal (bottom) split:
        rconsole_width = 0,

        -- Set the bottom terminal height (pick what you like):
        rconsole_height = 20,

        min_editor_width = 72,

        hook = {
          on_filetype = function()
            local wk = require("which-key")
            wk.add({
              -- Acciones específicas de R (las genéricas están en runner.lua)
              { "<leader>rd", group = " R Docs", buffer = 0 },
              { "<leader>rdh", "<Plug>RHelp", desc = "Ayuda función", buffer = 0 },
              { "<leader>rds", "<Plug>RDSummary", desc = "summary(objeto)", buffer = 0 },
              { "<leader>rdn", "<Plug>RDNames", desc = "names(objeto)", buffer = 0 },
              { "<leader>rdt", "<Plug>RDStr", desc = "str(objeto)", buffer = 0 },

              { "<leader>rw", group = " R Workspace", buffer = 0 },
              { "<leader>rwo", "<Plug>ROpenObjectBrowser", desc = "Object browser", buffer = 0 },
              { "<leader>rwl", "<Plug>RListSpace", desc = "ls() workspace", buffer = 0 },
              { "<leader>rwv", "<Plug>RViewDF", desc = "Ver dataframe", buffer = 0 },

              -- Plotting
              { "<leader>rg", "<Plug>RPlot", desc = "Plot objeto", buffer = 0 },
            })
            -- Enter para enviar línea sigue funcionando
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
