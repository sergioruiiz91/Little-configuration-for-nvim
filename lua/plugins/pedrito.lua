-- ~/.config/nvim/lua/plugins/pedrito.lua

local function set_pedrito_colors()
  -- Cuerpo
  vim.api.nvim_set_hl(0, "PBL", { fg = "#b3e5fc" }) -- azul muy claro (pecho)
  vim.api.nvim_set_hl(0, "PBM", { fg = "#29b6f6" }) -- azul cielo vivo
  vim.api.nvim_set_hl(0, "PBD", { fg = "#0288d1" }) -- azul medio
  vim.api.nvim_set_hl(0, "PBX", { fg = "#01579b" }) -- azul oscuro
  -- Acentos
  vim.api.nvim_set_hl(0, "PCY", { fg = "#00e5ff" }) -- cyan eléctrico (cresta)
  vim.api.nvim_set_hl(0, "PAC", { fg = "#40c4ff" }) -- azul acento ala
  vim.api.nvim_set_hl(0, "PIC", { fg = "#80d8ff" }) -- azul hielo belly
  -- Cola
  vim.api.nvim_set_hl(0, "PTL", { fg = "#00b0ff" }) -- cola azul brillante
  vim.api.nvim_set_hl(0, "PTM", { fg = "#0091ea" }) -- cola media
  vim.api.nvim_set_hl(0, "PTD", { fg = "#1565c0" }) -- punta cola azul marino
  -- Pico
  vim.api.nvim_set_hl(0, "PBK", { fg = "#ffd54f" }) -- pico amarillo
  vim.api.nvim_set_hl(0, "PBA", { fg = "#ffb300" }) -- pico ámbar
  -- Ojo
  vim.api.nvim_set_hl(0, "PEW", { fg = "#e3f2fd" }) -- ojo blanco azulado
  vim.api.nvim_set_hl(0, "PEP", { fg = "#0d47a1" }) -- pupila azul marino
  -- Patas
  vim.api.nvim_set_hl(0, "PFT", { fg = "#4e342e" }) -- patas marrón
  -- Nombre degradado cyan → marino
  vim.api.nvim_set_hl(0, "PCN", { fg = "#00e5ff" })
  vim.api.nvim_set_hl(0, "PN2", { fg = "#29b6f6" })
  vim.api.nvim_set_hl(0, "PN3", { fg = "#0288d1" })
  vim.api.nvim_set_hl(0, "PN4", { fg = "#01579b" })
  vim.api.nvim_set_hl(0, "PN5", { fg = "#1565c0" })
  vim.api.nvim_set_hl(0, "PSB", { fg = "#4fc3f7" })
end

vim.schedule(set_pedrito_colors)
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = set_pedrito_colors })

-- ══════════════════════════════════════════════
--  HELPERS
-- ══════════════════════════════════════════════
local nl = { "\n", "Normal" }
local function px(hl, n)
  return { string.rep("██", n), hl }
end
local function sp(n)
  return { string.rep("  ", n), "Normal" }
end

local parrot = {}
local function row(...)
  for _, seg in ipairs({ ... }) do
    table.insert(parrot, seg)
  end
  table.insert(parrot, nl)
end

-- ══════════════════════════════════════════════
--  PEDRITO — pixel art azules vivos
-- ══════════════════════════════════════════════
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

table.insert(parrot, nl)

-- ══════════════════════════════════════════════
--  NOMBRE degradado cyan → marino
-- ══════════════════════════════════════════════
for _, seg in ipairs({
  {
    "  ██████╗ ███████╗██████╗ ██████╗ ██╗████████╗ ██████╗ \n",
    "PCN",
  },
  {
    "  ██╔══██╗██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔═══██╗\n",
    "PN2",
  },
  {
    "  ██████╔╝█████╗  ██║  ██║██████╔╝██║   ██║   ██║   ██║\n",
    "PN3",
  },
  {
    "  ██╔═══╝ ██╔══╝  ██║  ██║██╔══██╗██║   ██║   ██║   ██║\n",
    "PN4",
  },
  {
    "  ██║     ███████╗██████╔╝██║  ██║██║   ██║   ╚██████╔╝\n",
    "PN5",
  },
  {
    "  ╚═╝     ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ \n",
    "PSB",
  },
  { "\n", "Normal" },
}) do
  table.insert(parrot, seg)
end

-- ══════════════════════════════════════════════
--  PLUGIN — solo toca el dashboard de snacks
-- ══════════════════════════════════════════════
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
