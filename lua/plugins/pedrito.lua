-- ~/.config/nvim/lua/plugins/pedrito.lua
-- ~/.config/nvim/lua/plugins/pedrito.lua

local function set_pedrito_colors()
  vim.api.nvim_set_hl(0, "PBL", { fg = "#b3e5fc" })
  vim.api.nvim_set_hl(0, "PBM", { fg = "#29b6f6" })
  vim.api.nvim_set_hl(0, "PBD", { fg = "#0288d1" })
  vim.api.nvim_set_hl(0, "PBX", { fg = "#01579b" })
  vim.api.nvim_set_hl(0, "PCY", { fg = "#00e5ff" })
  vim.api.nvim_set_hl(0, "PAC", { fg = "#40c4ff" })
  vim.api.nvim_set_hl(0, "PIC", { fg = "#80d8ff" })
  vim.api.nvim_set_hl(0, "PTL", { fg = "#00b0ff" })
  vim.api.nvim_set_hl(0, "PTM", { fg = "#0091ea" })
  vim.api.nvim_set_hl(0, "PTD", { fg = "#1565c0" })
  vim.api.nvim_set_hl(0, "PBK", { fg = "#ffd54f" })
  vim.api.nvim_set_hl(0, "PBA", { fg = "#ffb300" })
  vim.api.nvim_set_hl(0, "PEW", { fg = "#e3f2fd" })
  vim.api.nvim_set_hl(0, "PEP", { fg = "#0d47a1" })
  vim.api.nvim_set_hl(0, "PFT", { fg = "#4e342e" })
  vim.api.nvim_set_hl(0, "PCN", { fg = "#00e5ff" })
  vim.api.nvim_set_hl(0, "PN2", { fg = "#29b6f6" })
  vim.api.nvim_set_hl(0, "PN3", { fg = "#0288d1" })
  vim.api.nvim_set_hl(0, "PN4", { fg = "#01579b" })
  vim.api.nvim_set_hl(0, "PN5", { fg = "#1565c0" })
  vim.api.nvim_set_hl(0, "PSB", { fg = "#4fc3f7" })
end

set_pedrito_colors()
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = set_pedrito_colors })

-- Formato correcto para snacks: { "texto", hl = "GRUPO" }
local function px(hl, n)
  return { string.rep("██", n), hl = hl }
end
local function sp(n)
  return { string.rep("  ", n) }
end
local function nl()
  return { "\n" }
end

local parrot = {}
local function row(...)
  for _, seg in ipairs({ ... }) do
    table.insert(parrot, seg)
  end
  table.insert(parrot, nl())
end

row(sp(6), px("PCY", 1), px("PAC", 1), px("PCY", 1), sp(7))
row(sp(5), px("PBM", 1), px("PAC", 1), px("PIC", 1), px("PAC", 1), px("PBM", 1), sp(5))
row(
  sp(4),
  px("PBD", 1),
  px("PBM", 1),
  px("PEW", 1),
  px("PIC", 1),
  px("PBM", 1),
  px("PBD", 1),
  px("PBK", 1),
  px("PBA", 1),
  sp(2)
)
row(sp(4), px("PBM", 2), px("PEP", 1), px("PBM", 2), px("PBK", 1), px("PBA", 1), sp(3))
row(sp(3), px("PBD", 1), px("PAC", 1), px("PIC", 2), px("PAC", 1), px("PBD", 1), sp(4))
row(sp(2), px("PBD", 1), px("PBM", 1), px("PAC", 1), px("PIC", 2), px("PAC", 1), px("PBD", 1), px("PBX", 1), sp(2))
row(
  sp(1),
  px("PBX", 1),
  px("PBM", 1),
  px("PCY", 1),
  px("PIC", 2),
  px("PBM", 1),
  px("PBD", 1),
  px("PBX", 1),
  px("PTD", 1),
  sp(1)
)
row(
  sp(1),
  px("PBX", 1),
  px("PCY", 1),
  px("PIC", 1),
  px("PAC", 1),
  px("PIC", 1),
  px("PBM", 1),
  px("PBX", 1),
  px("PTD", 1),
  sp(2)
)
row(sp(2), px("PBD", 1), px("PBM", 1), px("PAC", 2), px("PBM", 1), px("PBD", 1), px("PBX", 1), sp(3))
row(sp(2), px("PBD", 1), px("PBM", 1), px("PAC", 1), px("PBM", 1), px("PBD", 1), px("PBX", 1), sp(4))
row(
  px("PTL", 2),
  px("PTM", 1),
  px("PBM", 1),
  px("PTM", 1),
  px("PBX", 1),
  px("PTD", 1),
  px("PCY", 1),
  px("PTL", 1),
  sp(1)
)
row(
  px("PTL", 1),
  px("PCY", 1),
  px("PTM", 1),
  px("PBD", 1),
  px("PFT", 2),
  px("PTD", 1),
  px("PCY", 1),
  px("PTM", 1),
  sp(1)
)
row(px("PTL", 1), px("PTM", 1), px("PCY", 1), px("PFT", 2), px("PBD", 1), px("PTL", 1), px("PTM", 1), sp(3))
row(px("PTD", 1), px("PTL", 1), px("PCY", 1), px("PFT", 4), px("PTD", 1), px("PTL", 1), sp(2))
row(px("PTD", 1), px("PTL", 1), px("PTM", 1), sp(7))

table.insert(parrot, nl())

for _, seg in ipairs({
  {
    "  ██████╗ ███████╗██████╗ ██████╗ ██╗████████╗ ██████╗ \n",
    hl = "PCN",
  },
  {
    "  ██╔══██╗██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔═══██╗\n",
    hl = "PN2",
  },
  {
    "  ██████╔╝█████╗  ██║  ██║██████╔╝██║   ██║   ██║   ██║\n",
    hl = "PN3",
  },
  {
    "  ██╔═══╝ ██╔══╝  ██║  ██║██╔══██╗██║   ██║   ██║   ██║\n",
    hl = "PN4",
  },
  {
    "  ██║     ███████╗██████╔╝██║  ██║██║   ██║   ╚██████╔╝\n",
    hl = "PN5",
  },
  {
    "  ╚═╝     ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ \n",
    hl = "PSB",
  },
  { "\n" },
}) do
  table.insert(parrot, seg)
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          { align = "center", text = parrot, padding = 1 },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          keys = {
            { icon = " ", key = "ff", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
