local config = function()
	require("neoconf").setup({})
	local on_attach = require("utils.lsp").on_attach
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")
	local capabilities = cmp_nvim_lsp.default_capabilities()
	local signs = { Error = "X", Warn = "!", Hint = "H", Info = "I" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	lspconfig.asm_lsp.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- c
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {},
		cmd = {
			"clangd",
			"--query-driver='/home/beaver/BibaOS/toolchain/i686-elf/bin/i686_elf_gcc'",
			"--offset-encoding=utf-16",
		},
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local cpplint = require("efmls-configs.linters.cpplint")
	local clang_format = require("efmls-configs.formatters.clang_format")

	-- efm
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"c",
			"assembly",
            "cpp"
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				c = { cpplint, clang_format },
				assembly = {},
                cpp = {cpplint, clang_format}
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		--"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"j-hui/fidget.nvim",
	},
}
