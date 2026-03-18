-- 󰏪 OIL.NVIM - EXPLORADOR DE ARCHIVOS SIMPLE
return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>oo", "<cmd>Oil<cr>", desc = "󰏪 Abrir Oil" },
      { "<leader>op", function() require("oil").toggle_preview() end, desc = "󰏪 Preview en Oil" },
    },
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
      keymaps = {
        ["H"] = "actions.cd", -- Cambia el CWD de Neovim a la carpeta actual
        ["<CR>"] = {
          callback = function()
            local oil = require("oil")
            local entry = oil.get_cursor_entry()
            if entry and entry.type == "file" then
              local name = entry.name
              if name:match("%.pdf$") or name:match("%.jpg$") or name:match("%.jpeg$") or name:match("%.png$") then
                local path = oil.get_current_dir() .. name
                vim.fn.jobstart({ "firefox", path }, { detach = true })
                return
              end
            end
            oil.select()
          end,
          desc = "Abrir (Firefox si es PDF/IMG)",
        },
      },
    },
  },
}
