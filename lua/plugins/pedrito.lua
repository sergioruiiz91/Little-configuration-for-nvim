-- ~/.config/nvim/lua/plugins/pedrito.lua

local function set_pedrito_colors()
  -- PALETA NINFA REAL (Basada en tu imagen)
  vim.api.nvim_set_hl(0, "PBL", { fg = "#7a818e" }) -- Gris cuerpo medio
  vim.api.nvim_set_hl(0, "PBM", { fg = "#5c6370" }) -- Gris cuerpo oscuro
  vim.api.nvim_set_hl(0, "PBD", { fg = "#3e4452" }) -- Sombras gris
  vim.api.nvim_set_hl(0, "PBX", { fg = "#21252b" }) -- Contorno negro/gris muy oscuro
  
  vim.api.nvim_set_hl(0, "PCY", { fg = "#e5c07b" }) -- Cresta Amarilla (Fiel a la imagen)
  vim.api.nvim_set_hl(0, "PAC", { fg = "#f2cc8f" }) -- Cara Amarilla clara
  vim.api.nvim_set_hl(0, "PIC", { fg = "#ffffff" }) -- Franja BLANCA del ala (Clave en ninfas)
  
  vim.api.nvim_set_hl(0, "PTL", { fg = "#5c6370" }) -- Cola gris
  vim.api.nvim_set_hl(0, "PTM", { fg = "#3e4452" }) 
  vim.api.nvim_set_hl(0, "PTD", { fg = "#21252b" }) 
  
  vim.api.nvim_set_hl(0, "PBK", { fg = "#e06c75" }) -- Moflete Naranja/Rojizo intenso
  vim.api.nvim_set_hl(0, "PBA", { fg = "#be5046" }) 
  
  vim.api.nvim_set_hl(0, "PEW", { fg = "#ffffff" }) -- Brillo ojo
  vim.api.nvim_set_hl(0, "PEP", { fg = "#000000" }) -- Pupila
  vim.api.nvim_set_hl(0, "PFT", { fg = "#abb2bf" }) -- Pico/Patas grises
  
  -- TEXTOS EN GRIS (Título y Menú)
  local grey = "#5c6370"
  local light_grey = "#abb2bf"
  
  vim.api.nvim_set_hl(0, "PCN", { fg = light_grey })
  vim.api.nvim_set_hl(0, "PN2", { fg = grey })
  vim.api.nvim_set_hl(0, "PN3", { fg = light_grey })
  vim.api.nvim_set_hl(0, "PN4", { fg = grey })
  vim.api.nvim_set_hl(0, "PN5", { fg = light_grey })
  vim.api.nvim_set_hl(0, "PSB", { fg = grey })
  
  -- Highlights para el menú de Snacks (Solo en dashboard)
  vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#828997" })
  vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#5c6370" })
  vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#abb2bf" })
  vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#5c6370" })
  vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = "#abb2bf" })
end

set_pedrito_colors()
vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = set_pedrito_colors })

-- FONDO SÓLIDO PARA EL DASHBOARD
vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_dashboard",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#161616" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "#161616" })
  end,
})

local function px(hl, n) return { string.rep("██", n), hl = hl } end
local function sp(n) return { string.rep("  ", n) } end
local function nl() return { "\n" } end

local parrot = {}
local function row(...)
  for _, seg in ipairs({ ... }) do table.insert(parrot, seg) end
  table.insert(parrot, nl())
end

-- DIBUJO AJUSTADO A NINFA REAL
row(sp(6), px("PCY", 1), px("PAC", 1), px("PCY", 1), sp(7)) -- Cresta Amarilla
row(sp(5), px("PBM", 1), px("PAC", 1), px("PAC", 1), px("PAC", 1), px("PBM", 1), sp(5)) -- Cara Amarilla
row(sp(4), px("PBD", 1), px("PBM", 1), px("PEW", 1), px("PAC", 1), px("PBM", 1), px("PBD", 1), px("PBK", 1), px("PBA", 1), sp(2)) -- Moflete naranja
row(sp(4), px("PBM", 2), px("PEP", 1), px("PBM", 2), px("PBK", 1), px("PBA", 1), sp(3))
row(sp(3), px("PBD", 1), px("PIC", 1), px("PIC", 2), px("PIC", 1), px("PBD", 1), sp(4)) -- Pecho con blanco
row(sp(2), px("PBD", 1), px("PBM", 1), px("PIC", 1), px("PIC", 2), px("PIC", 1), px("PBD", 1), px("PBX", 1), sp(2)) -- Ala blanca
row(sp(1), px("PBX", 1), px("PBM", 1), px("PBM", 1), px("PIC", 2), px("PBM", 1), px("PBD", 1), px("PBX", 1), px("PTD", 1), sp(1))
row(sp(1), px("PBX", 1), px("PBM", 1), px("PBM", 1), px("PIC", 1), px("PIC", 1), px("PBM", 1), px("PBX", 1), px("PTD", 1), sp(2))
row(sp(2), px("PBD", 1), px("PBM", 1), px("PBM", 2), px("PBM", 1), px("PBD", 1), px("PBX", 1), sp(3))
row(sp(2), px("PBD", 1), px("PBM", 1), px("PBM", 1), px("PBM", 1), px("PBD", 1), px("PBX", 1), sp(4))
row(px("PTL", 2), px("PTM", 1), px("PBM", 1), px("PTM", 1), px("PBX", 1), px("PTD", 1), px("PBM", 1), px("PTL", 1), sp(1))
row(px("PTL", 1), px("PBM", 1), px("PTM", 1), px("PBD", 1), px("PFT", 2), px("PTD", 1), px("PBM", 1), px("PTM", 1), sp(1))
row(px("PTL", 1), px("PTM", 1), px("PBM", 1), px("PFT", 2), px("PBD", 1), px("PTL", 1), px("PTM", 1), sp(3))
row(px("PTD", 1), px("PTL", 1), px("PBM", 1), px("PFT", 4), px("PTD", 1), px("PTL", 1), sp(2))
row(px("PTD", 1), px("PTL", 1), px("PTM", 1), sp(7))

table.insert(parrot, nl())

for _, seg in ipairs({
  { "  ██████╗ ███████╗██████╗ ██████╗ ██╗████████╗ ██████╗ \n", hl = "PCN" },
  { "  ██╔══██╗██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔═══██╗\n", hl = "PN2" },
  { "  ██████╔╝█████╗  ██║  ██║██████╔╝██║   ██║   ██║   ██║\n", hl = "PN3" },
  { "  ██╔═══╝ ██╔══╝  ██║  ██║██╔══██╗██║   ██║   ██║   ██║\n", hl = "PN4" },
  { "  ██║     ███████╗██████╔╝██║  ██║██║   ██║   ╚██████╔╝\n", hl = "PN5" },
  { "  ╚═╝     ╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝    ╚═════╝ \n", hl = "PSB" },
  { "\n" },
}) do table.insert(parrot, seg) end

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
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
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
