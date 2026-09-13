return {
	"saghen/blink.cmp",
	dependencies = {
		"saghen/blink.lib",
	},
	build = function()
		require("blink.cmp").build():pwait()
	end,
	opts = {
		keymap = { preset = "default" },
		completion = { documentation = { auto_show = false } },
		sources = { default = { "lsp", "path", "buffer" } },
		fuzzy = { implementation = "rust" },
	},
}
