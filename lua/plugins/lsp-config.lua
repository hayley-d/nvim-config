return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"mfussenegger/nvim-jdtls",
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			--local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")

			-- setup lua langauge server
			lspconfig.lua_ls.setup({
				--capabilities = capabilities
			})
			-- setup ts language server
			lspconfig.ts_ls.setup({
				--capabilities = capabilities
			})
			-- setup html language server
			lspconfig.html.setup({
				--capabilities = capabilities
			})
			-- c++ setup
			lspconfig.clangd.setup({
				--capabilities = capabilities
			})
			-- Rust LSP setup
			lspconfig.rust_analyzer.setup({
				--capabilities = capabilities
				settings = {
					["rust-analyzer"] = {
						assist = {
							importGranularity = "module",
							importPrefix = "by_self",
						},
						cargo = {
							allFeatures = true,
						},
						procMacro = {
							enable = true,
						},
					},
				},
			})
			-- Go LSP setup
			lspconfig.gopls.setup({
				cmd = { "gopls" },
				filetypes = { "go", "gomod" },
				root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
				--capabilities = capabilities
			})
			-- setup eslint
			lspconfig.eslint.setup({
				bin = "eslint",
				code_actions = {
					enable = true,
					apply_on_save = {
						enable = true,
						types = { "directive", "problem", "suggestion", "layout" },
					},
					disable_rule_comment = {
						enable = true,
						location = "separate_line",
					},
				},
				diagnostics = {
					enable = true,
					report_unused_disable_directives = false,
					run_on = "type", -- or `save`
				},
			})

			-- vim motion for <shift> + k to show documentation about the code under the cursor
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim motion for g + d to go to where the code under the cursor is defined
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim motion for <shift> + c + a to display code suggestions for the code
			vim.keymap.set({ "n", "v" }, "CA", vim.lsp.buf.code_action, {})
			-- vim motion for <space> + c + <shift> + r to smart rename code under cursor
			vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "Code Rename" })
		end,
	},
}
