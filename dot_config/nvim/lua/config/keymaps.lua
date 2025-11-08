-- clear search highlights
vim.api.nvim_set_keymap("n", "<Leader>ch", ":noh<CR>", { noremap = true, silent = true })
-- escape
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true, silent = true })
-- window splits
vim.api.nvim_set_keymap("n", "<Leader>sv", "<C-w>v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>sh", "<C-w>s", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>sc", "<C-w>c", { noremap = true, silent = true })
