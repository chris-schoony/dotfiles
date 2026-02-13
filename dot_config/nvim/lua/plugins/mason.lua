return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"cssls",
			"html",
			"emmet_ls",
			"gopls",
			"astro",
			"tailwindcss",
			"tsgo",
			"mdx_analyzer",
			"glsl_analyzer",
			"jsonls",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"b0o/schemastore.nvim",
		"j-hui/fidget.nvim",
	},
}
