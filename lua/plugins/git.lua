-- 󰊢 GIT LOG & INTEGRACIÓN GIT
-- Extiende snacks.nvim (incluido por LazyVim) para añadir vistas de git log
-- y atajos mnemotécnicos bajo el prefijo <leader>g (Git).

return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = { enabled = true },
      picker = { enabled = true },
    },
    keys = {
      -- Git Log
      { "<leader>gl", function() Snacks.picker.git_log() end,       desc = "󰜘 git log (repo)" },
      { "<leader>gL", function() Snacks.picker.git_log_file() end,  desc = "󰜘 git log (archivo)" },
      -- Git Status / Diff
      { "<leader>gs", function() Snacks.picker.git_status() end,    desc = "󰊢 git status" },
      -- Git Blame
      { "<leader>gb", function() Snacks.git.blame_line() end,       desc = "󰜘 git blame línea" },
      -- Lazygit (TUI completo, requiere lazygit instalado)
      { "<leader>gg", function() Snacks.lazygit() end,              desc = "󰊢 lazygit" },
    },
  },
}
