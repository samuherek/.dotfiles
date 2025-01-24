return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			disable_background = true,
			disable_italics = true,
		})
		vim.cmd("colorscheme rose-pine")
		-- So that string values in HTML tags are whiteish instead
		vim.cmd("hi @string.special guifg=#e0def4")
	end,
}
