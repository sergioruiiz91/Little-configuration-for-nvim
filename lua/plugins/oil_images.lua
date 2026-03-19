-- 󰏪 OIL.NVIM - EXPLORADOR DE ARCHIVOS SIMPLE
-- 󰏪 OIL.NVIM - EXPLORADOR DE ARCHIVOS SIMPLE
return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>oo", "<cmd>Oil<cr>", desc = "󰏪 Abrir Oil" },
			{
				"<leader>op",
				function()
					require("oil").toggle_preview()
				end,
				desc = "󰏪 Preview en Oil",
			},
		},
		opts = {
			default_file_explorer = true,
			view_options = { show_hidden = true },
			keymaps = {
				["H"] = "actions.cd",

				-- 🔥 Navegación
				["<BS>"] = "actions.parent",

				-- 🔥 Copia ultra-robusta (Wayland/X11 + Yanky + Neovim)
				["yp"] = {
					callback = function()
						local oil = require("oil")
						local entry = oil.get_cursor_entry()
						local dir = oil.get_current_dir()
						if not entry or not dir then return end
						local path = dir .. entry.name
						
						-- 1. Forzar en registros de Neovim
						vim.fn.setreg("+", path)
						vim.fn.setreg("*", path)
						vim.fn.setreg('"', path)
						
						-- 2. Sistema (Wayland / X11)
						if vim.fn.executable("wl-copy") == 1 then
							vim.fn.jobstart("printf " .. vim.fn.shellescape(path) .. " | wl-copy", { detach = true })
						elseif vim.fn.executable("xclip") == 1 then
							vim.fn.jobstart("printf " .. vim.fn.shellescape(path) .. " | xclip -selection clipboard", { detach = true })
						end

						-- 3. Sincronizar con Yanky (si está instalado)
						pcall(function() require("yanky.lib").put(path, false) end)
						
						vim.notify("Copiado: " .. path, vim.log.levels.INFO, { title = "Oil" })
					end,
					desc = "Copiar ruta absoluta",
				},
				["yr"] = {
					callback = function()
						local oil = require("oil")
						local entry = oil.get_cursor_entry()
						local dir = oil.get_current_dir()
						if not entry or not dir then return end
						local path = vim.fn.fnamemodify(dir .. entry.name, ":.")

						vim.fn.setreg("+", path)
						vim.fn.setreg("*", path)
						if vim.fn.executable("wl-copy") == 1 then
							vim.fn.jobstart("printf " .. vim.fn.shellescape(path) .. " | wl-copy", { detach = true })
						end
						pcall(function() require("yanky.lib").put(path, false) end)
						vim.notify("Copiado: " .. path, vim.log.levels.INFO)
					end,
					desc = "Copiar ruta relativa",
				},
				["yn"] = {
					callback = function()
						local entry = require("oil").get_cursor_entry()
						if not entry then return end
						local name = entry.name

						vim.fn.setreg("+", name)
						vim.fn.setreg("*", name)
						if vim.fn.executable("wl-copy") == 1 then
							vim.fn.jobstart("printf " .. vim.fn.shellescape(name) .. " | wl-copy", { detach = true })
						end
						pcall(function() require("yanky.lib").put(name, false) end)
						vim.notify("Copiado: " .. name, vim.log.levels.INFO)
					end,
					desc = "Copiar nombre",
				},

				-- 🔥 Copiar / pegar archivos físicos (Usando registros de Neovim)
				-- Nota: 'yy' en Oil por defecto copia la línea con su ID oculto.
				-- Al ponerlo aquí, nos aseguramos de que use las acciones de Oil si existen.
				["yy"] = "actions.copy_to_system_clipboard",
				["pp"] = "actions.paste_from_system_clipboard",

				-- 🔥 Enter inteligente
				["<CR>"] = {
					callback = function()
						local oil = require("oil")
						local entry = oil.get_cursor_entry()

						if entry and entry.type == "file" then
							local name = entry.name
							local path = oil.get_current_dir() .. name

							if
								name:match("%.pdf$")
								or name:match("%.jpg$")
								or name:match("%.jpeg$")
								or name:match("%.png$")
							then
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
