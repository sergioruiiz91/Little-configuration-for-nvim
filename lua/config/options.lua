-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_picker = "telescope"

-- Asegurar que Neovim encuentra los binarios de Cargo (Yazi, etc.) y Snap
local cargo_bin = vim.fn.expand("~/.cargo/bin")
local snap_bin = "/snap/bin"

if vim.fn.isdirectory(cargo_bin) == 1 then
  vim.env.PATH = cargo_bin .. ":" .. vim.env.PATH
end

if vim.fn.isdirectory(snap_bin) == 1 then
  vim.env.PATH = snap_bin .. ":" .. vim.env.PATH
end
