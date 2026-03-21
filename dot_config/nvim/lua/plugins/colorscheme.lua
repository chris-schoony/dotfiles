return {
	"neanias/everforest-nvim",
	version = false,
	priority = 1000,
	config = function()
		local theme = require("everforest")
		theme.setup({
			background = "hard",
		})
		theme.load()
	end,
}
