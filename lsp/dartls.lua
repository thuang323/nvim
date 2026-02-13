return {
	cmd = { "dart", "language-server", "--protocol=lsp" },
	filetypes = { "dart" },
	init_options = {
		onlyAnalyzeProjectsWithOpenFiles = true,
		suggestFromUnimportedLibraries = true,
		closingLabels = true,
		outline = true,
		flutterOutline = true,
	},
	root_markers = { "pubspec.yaml" },
	settings = {
		dart = {
			completeFunctionCalls = true,
			showTodos = true,
		},
	},
}
