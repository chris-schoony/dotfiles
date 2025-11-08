return {
	"nvim-lualine/lualine.nvim",
	opts = {
		sections = {
			lualine_c = {
				{
					"filename",
					path = 0,
				},
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "filetype" },
		},
		options = {
			section_separators = "",
			component_separators = "|",
		},
	},
}
