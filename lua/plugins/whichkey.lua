local config = function()
	local wk = require("which-key")
	wk.register({
		["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
		["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
		["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
		["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
		["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
	})
end

return {
	"folke/which-key.nvim",
	lazy = false,
	config = config,
}
