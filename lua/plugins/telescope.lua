return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-media-files.nvim" },
	},
	opts = function()
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		-- Tu función inteligente mejorada
		local function open_smart(bufnr)
			local selection = action_state.get_selected_entry()
			if not selection then
				return
			end
			local filename = selection.path or selection.filename or selection[1]
			local lower_name = filename:lower()

			-- Si es PDF o imagen, puedes elegir: abrir en buffer o seguir usando Firefox
			if
				lower_name:match("%.pdf$")
				or lower_name:match("%.jpg$")
				or lower_name:match("%.jpeg$")
				or lower_name:match("%.png$")
			then
				actions.close(bufnr)
				-- Si quieres abrirlo DENTRO de nvim en un buffer:
				vim.cmd("edit " .. vim.fn.fnameescape(filename))
			-- Si prefieres Firefox como antes, descomenta la línea de abajo y comenta la de arriba:
			-- vim.fn.jobstart({ "firefox", filename }, { detach = true })
			else
				actions.select_default(bufnr)
			end
		end

		return {
			defaults = {
				-- ... tus configuraciones de layout se mantienen igual ...
				mappings = {
					i = { ["<CR>"] = open_smart },
					n = { ["<CR>"] = open_smart },
				},
			},
			extensions = {
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
					find_command = "rg", -- Asegúrate de tener ripgrep instalado
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("media_files") -- IMPORTANTE cargar la extensión
	end,
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "󰈔 buscar archivo" },
		-- Nueva tecla para buscar específicamente multimedia con preview
		{ "<leader>fm", "<cmd>Telescope media_files<cr>", desc = "󰏆 buscar multimedia" },
	},
}
