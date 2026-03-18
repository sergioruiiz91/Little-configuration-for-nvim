return {
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = {
      "saghen/blink.compat",
      "fang2hou/blink-copilot", -- Corregido el nombre del repositorio

      -- snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    opts = function(_, opts)
      opts = opts or {}

      -- Cargar snippets (incluye LaTeX)
      require("luasnip.loaders.from_vscode").lazy_load()

      local mathzone = require("config.latex_mathzone")

      -- Fuentes de completado
      opts.sources = opts.sources or {}
      opts.sources.default = {
        "lsp",
        "snippets",
        "path",
        "buffer",
        "copilot",

        -- si quieres mantener los de avante:
        "avante_commands",
        "avante_mentions",
        "avante_files",
      }

      -- Mantén tus providers
      opts.sources.providers = opts.sources.providers or {}

      opts.sources.providers.copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
        opts = {
          max_completions = 3,
          max_attempts = 4,
        },
      }

      opts.sources.providers.avante_commands = opts.sources.providers.avante_commands
        or {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90,
          opts = {},
        }
      opts.sources.providers.avante_files = opts.sources.providers.avante_files
        or {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 100,
          opts = {},
        }
      opts.sources.providers.avante_mentions = opts.sources.providers.avante_mentions
        or {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000,
          opts = {},
        }

      -- Gate: snippets (LaTeX) sólo cuando estás en mathzone en md/rmd
      opts.sources.providers.snippets = opts.sources.providers.snippets or {}
      opts.sources.providers.snippets.enabled = function()
        local ft = vim.bo.filetype
        if ft == "markdown" or ft == "rmd" then
          return mathzone.in_mathzone()
        end
        return true
      end

      -- Autocompletado mientras escribes
      opts.completion = opts.completion or {}
      opts.completion.trigger = opts.completion.trigger or {}
      opts.completion.trigger.show_on_keyword = true
      opts.completion.trigger.show_on_insert_on_trigger_character = true

      -- UI moderna (docs lateral)
      opts.completion.documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        treesitter_highlighting = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder",
        },
      }
      opts.completion.menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      }
      opts.signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      }

      return opts
    end,
  },
}
