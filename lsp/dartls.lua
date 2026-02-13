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
    }
  }
  -- cmd = { 'dart', 'language-server', '--protocol=lsp' },
  --   filetypes = { 'dart' },
  --   root_dir = util.root_pattern 'pubspec.yaml',
  --   init_options = {
  --     onlyAnalyzeProjectsWithOpenFiles = true,
  --     suggestFromUnimportedLibraries = true,
  --     closingLabels = true,
  --     outline = true,
  --     flutterOutline = true,
  --   },
  --   settings = {
  --     dart = {
  --       completeFunctionCalls = true,
  --       showTodos = true,
  --     },
  --   },
}
