-- Ejemplo con lazy.nvim
return {
	"3rd/image.nvim",
	opts = {
		backend = "kitty", -- o "ueberzug" si no usas Kitty/Wezterm
		integrations = {
			markdown = {
				enabled = false, -- Desactivado para que mdmath.nvim funcione
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
			},
			neorg = { enabled = true },
		},
		max_width = nil,
		max_height = nil,
		max_width_window_percentage = nil,
		max_height_window_percentage = 50,
		window_overlap_clear_enabled = false,
		pipe_path = "/tmp/nvim-image-nvim-transparent",
	},
}
