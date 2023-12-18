local M = {}
local telescope_builtin = require("telescope.builtin")

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	-- vim.keymap.set("n", "<leader>lo", "<CR>", opts)
	if client.name == "pyright" then
		vim.keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
	end
end

return M
