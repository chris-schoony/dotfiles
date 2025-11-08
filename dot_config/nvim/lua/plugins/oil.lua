return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			},
			float = {
				border = "rounded",
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>se", ":Oil --float<CR>", { noremap = true, silent = true })
	end,
}
