return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local conf = require("telescope.config").values
		require("telescope").setup({
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "!node_modules" },
				},
				live_grep = {
					glob_pattern = { "!.git", "!node_modules" },
					additional_args = function()
						return { "--hidden" }
					end,
					vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		require("telescope").load_extension("fzf")

		vim.api.nvim_set_keymap("n", "<leader>sf", ":Telescope find_files<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>sg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>sb", ":Telescope buffers<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>sn", ":Telescope notify<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>sw", ":Telescope grep_string<CR>", { noremap = true, silent = true })
	end,
}
