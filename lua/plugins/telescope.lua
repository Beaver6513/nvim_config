local config1 = function()
	local telescope = require("telescope")
	telescope.setup({})
end

local config2 = function()
	local fb_actions = require("telescope").extensions.file_browser.actions
	require("telescope").setup({
		extensions = {
			file_browser = {
				theme = "ivy",
				hijack_netrw = true,
				mappings = {
					["i"] = {
						["d"] = fb_actions.remove,
						["c"] = fb_actions.create_from_prompt,
						["y"] = fb_actions.copy,
						["m"] = fb_actions.move,
						["r"] = fb_actions.rename,
					},
				},
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-file-browser.nvim",
			dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
			lazy = false,
			config = config2,
		},
	},
	config = config1,
	keys = {
		vim.keymap.set("n", "<leader>?", ":Telescope oldfiles<CR>", { desc = "[?] Find recently opened files" }),
		vim.keymap.set(
			"n",
			"<leader>fb",
			":Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "[?] Find recently opened files" }
		),
		vim.keymap.set("n", "<leader><space>", ":Telescope buffers<CR>", { desc = "[ ] Find existing buffers" }),
		vim.keymap.set(
			"n",
			"<leader>/",
			":Telescope current_buffer_fuzzy_find<CR>",
			{ desc = "[/] Fuzzily search in current buffer" }
		),
		vim.keymap.set("n", "<leader>gf", ":Telescope git_files<CR>", { desc = "Search [G]it [F]iles" }),
		vim.keymap.set("n", "<leader>sf", ":Telescope find_files<CR>", { desc = "[S]earch [F]iles" }),
		vim.keymap.set("n", "<leader>sh", ":Telescope help_tags<CR>", { desc = "[S]earch [H]elp" }),
		vim.keymap.set("n", "<leader>sw", ":Telescope grep_string<CR>", { desc = "[S]earch current [W]ord" }),
		vim.keymap.set("n", "<leader>sg", ":Telescope live_grep<CR>", { desc = "[S]earch by [G]rep" }),
		vim.keymap.set("n", "<leader>sd", ":Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" }),
		vim.keymap.set("n", "<leader>sr", ":Telescope resume<CR>", { desc = "[S]earch [R]esume" }),
	},
}
