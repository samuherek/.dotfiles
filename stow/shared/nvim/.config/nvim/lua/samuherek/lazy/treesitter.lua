return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,

	config = function()
		local ts = require("nvim-treesitter")

		ts.setup()

		ts.install({
			"javascript",
			"typescript",
			"c",
			"lua",
			"rust",
			"vim",
			"vimdoc",
			"query",
			"python",
			"html",
			"css",
			"dart",
			"go",
			"terraform",
			"hcl",
			"bash",
			"yaml",

			-- git
			"gitcommit",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitignore",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
