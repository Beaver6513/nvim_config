local keymap = vim.keymap

-- Pane and Window Navigation
keymap.set("n", "<C-h>", "<C-w>h") -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j") -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k") -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l") -- Navigate Right
keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]]) -- Navigate Left
keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]]) -- Navigate Down
keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]]) -- Navigate Up
keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]]) -- Navigate Right
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>") -- Navigate Left
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>") -- Navigate Down
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>") -- Navigate Up
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>") -- Navigate Right

-- Window Management
keymap.set("n", "<leader>s|", ":vsplit<CR>") -- Split Vertically
keymap.set("n", "<leader>s-", ":split<CR>") -- Split Horizontally

-- custom commmand to toggle diagnostic
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config({
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	})
end, { desc = "toggle diagnostic" })

