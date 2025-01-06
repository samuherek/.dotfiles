return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = true,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			rust = { "rustfmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			html = { "prettier" },
			toml = { "taplo" },
			dart = { "dart_format" },
		},
	},
}
