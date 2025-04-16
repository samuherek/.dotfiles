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
            json = { "prettier_two" },
			toml = { "taplo" },
			dart = { "dart_format" },
			go = { "gofmt" },
			templ = { "templ" },
            nginx = { "nginxfmt" },
		},
        formatters = {
            prettier_two = {
                command = "prettier",
                args = { "--stdin-filepath", "$FILENAME", "--tab-width", "2" },
                stdin = true,
            },
        }
	},
}
