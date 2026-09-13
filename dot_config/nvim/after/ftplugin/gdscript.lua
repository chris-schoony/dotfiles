vim.lsp.start({
	name = "Godot",
	cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(os.getenv("GDScript_Port")) or 6005),
	root_dir = vim.fs.root(0, { "project.godot", ".git" }),
})
