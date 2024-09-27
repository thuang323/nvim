return {
	"aurum77/live-server.nvim",
  lazy = false,
	build = function()
		require("live_server.util").install()
	end,
	cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	config = function()
		local live_server = require("live_server")
		live_server.setup({
			browser_command = "firefox",
		})
	end,
}
