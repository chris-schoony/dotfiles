return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			odinfmt = {
				command = "odinfmt",
				args = { "-stdin" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettier" },
			html = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			astro = { "prettier" },
			go = { "gofumpt" },
			json = { "prettier" },
			odin = { "odinfmt" },
		},
	},
}
