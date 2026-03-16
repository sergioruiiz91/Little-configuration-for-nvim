return {
  -- DEPENDENCIA OBLIGATORIA: treesitter con los parsers que necesita R.nvim
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "r",
          "rnoweb",
          "markdown",
          "markdown_inline",
          "yaml",
          "latex",
          "csv",
        },
        highlight = { enable = true },
      })
    end,
  },

  -- EL PLUGIN
  {
    "R-nvim/R.nvim",
    lazy = false,
    config = function()
      local opts = {
        -- Auto-inicio al abrir .R, .Rmd, .qmd
        auto_start = "always",
        auto_quit = true,

        -- Argumentos de R
        R_args = { "--quiet", "--no-save" },

        -- Tamaño de ventanas
        min_editor_width = 72,
        rconsole_width = 78,

        -- Remapear el localleader del plugin a <Space>r como prefijo
        -- (LocalLeader sigue siendo \, pero aquí añadimos atajos propios)
        hook = {
          on_filetype = function()
            local map = function(mode, key, plug)
              vim.api.nvim_buf_set_keymap(0, mode, key, plug, { noremap = true, silent = true })
            end

            -- Atajos con prefijo <Space>r en lugar de \
            map("n", "<Space>rf", "<Plug>RStart")
            map("n", "<Space>rq", "<Plug>RClose")
            map("n", "<Space>rh", "<Plug>RHelp")
            map("n", "<Space>ro", "<Plug>ROpenObjectBrowser")
            map("n", "<Space>rp", "<Plug>RSendParagraph")

            -- Enter para ejecutar línea / selección (muy cómodo)
            map("n", "<Enter>", "<Plug>RDSendLine")
            map("v", "<Enter>", "<Plug>RSendSelection")
          end,
        },

        -- Mapeos dentro del Object Browser
        objbr_mappings = {
          c = "class",
          s = "summary",
          v = function()
            require("r.browser").toggle_view()
          end,
        },

        -- Comandos que probablemente no uses al principio
        disable_cmds = {
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      }

      -- Bonus: si lanzas nvim con R_AUTO_START=true (útil en terminal)
      -- Ejemplo: alias r="R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = "on startup"
        opts.objbr_auto_start = true
      end

      require("r").setup(opts)
    end,
  },
}
