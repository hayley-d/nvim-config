return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
        -- assembly formatting
        null_ls.builtins.formatting.asmfmt,
        -- java and c++ formatting
        null_ls.builtins.formatting.clang_format,
        -- rust formatting
        null_ls.builtins.formatting.dxfmt,
        -- js, ts, json formatting
        null_ls.builtins.formatting.prettier,
        -- Go formatting
        null_ls.builtins.formatting.gofumpt
				--require("none-ls.diagnostics.eslint")
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}