return {
	"stevearc/conform.nvim",
	opts = {
		log_level = vim.log.levels.INFO,
		notify_on_error = true,
		format_on_save = {
			lsp_fallback = false,
			timeout_ms = 1000,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			rust = { "rustfmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			html = { "prettier" },
			json = { "prettier_two" },
			toml = { "taplo" },
			dart = { "dart_format" },
			go = { "gofmt" },
			templ = { "templ", "injected" },
			nginx = { "nginxfmt" },
			css = { "prettier" },
			sql = { "sqruff" },
		},
		formatters = {
			prettier_two = {
				command = "prettier",
				args = { "--stdin-filepath", "$FILENAME", "--tab-width", "2" },
				stdin = true,
			},
		},
	},
}
