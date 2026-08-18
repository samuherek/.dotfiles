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
			"markdown",
			"sql",

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
				-- vim.treesitter.start() -- using this started complaining about oil
				-- This is to enable folding on the open file
				-- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- vim.wo[0][0].foldmethod = "expr"
				-- vim.wo[0][0].foldlevel = 1
			end,
		})
	end,
}
